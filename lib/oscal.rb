# frozen_string_literal: true

require_relative "oscal/version"
require_relative "oscal/versioned"
require_relative "oscal/version_registry"
require "lutaml/model"

# Oscal provides a clean facade for OSCAL model access.
#
# Usage:
#   require "oscal"
#
#   # Default version (latest) — auto-resolves constants
#   catalog = Oscal::Catalog.from_xml(File.read("catalog.xml"))
#
#   # Explicit version
#   v121 = Oscal.version("1.2.1")
#   catalog = v121::Catalog.from_xml(xml)
#
#   # Auto-detect version and parse
#   doc = Oscal.parse(File.read("catalog.xml"))
#
module Oscal
  class Error < StandardError; end

  @default_version = nil

  class << self
    # Load the default version module. Called lazily on first access.
    def default_version_module
      @default_version_module ||= begin
        require_relative "oscal/v1_2_1"
        VersionRegistry.latest_module
      end
    end

    # Use a specific OSCAL version.
    #
    # @param version_string [String] OSCAL version (e.g., "1.2.1")
    # @return [Module] The version module
    def version(version_string)
      mod = VersionRegistry.version_module(version_string)
      raise Error, "Unknown OSCAL version: #{version_string}" unless mod

      mod.init_models! unless mod.initialized?
      mod
    end

    # Parse an OSCAL document with automatic version detection.
    #
    # @param content [String] XML, JSON, or YAML string
    # @param model [Symbol] Model type (:catalog, :profile, etc.)
    # @return [Lutaml::Model::Serializable] Parsed instance
    def parse(content, model: nil)
      version = VersionRegistry.detect_version(content)
      if version
        ver_mod = VersionRegistry.version_module(version)
        if ver_mod
          ver_mod.init_models! unless ver_mod.initialized?
          register = ver_mod.register
        end
      end

      ver_mod ||= default_version_module
      register ||= ver_mod.register

      model_type = model || VersionRegistry.detect_model_type(content)
      raise Error, "Cannot detect model type. Specify with model: :catalog" unless model_type

      class_name = model_type.to_s.gsub(/(?:^|_)(.)/) { $1.upcase }
      klass = ver_mod.resolve_class(class_name)
      raise Error, "Unknown model type: #{class_name}" unless klass

      if content.lstrip.start_with?("<")
        register ? klass.from_xml(content, register: register) : klass.from_xml(content)
      elsif content.lstrip.start_with?("{")
        klass.from_json(content)
      else
        klass.from_yaml(content)
      end
    rescue StandardError => e
      raise Error, "Failed to parse OSCAL document: #{e.message}"
    end

    # Resolve missing constants from the default version module.
    def const_missing(name)
      name_s = name.to_s
      mod = default_version_module
      mod.init_models! unless mod.initialized?

      if mod.const_defined?(name_s)
        klass = mod.const_get(name_s)
        const_set(name, klass)
        klass
      else
        super
      end
    end
  end
end
