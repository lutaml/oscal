# frozen_string_literal: true

require "json"

module Oscal
  # Registry for OSCAL version-specific model trees.
  #
  # Manages the mapping between OSCAL version strings and their modules.
  # Version detection is based on the <oscal-version> element in the
  # document's metadata, not on XML namespace (all OSCAL versions share
  # the same namespace: http://csrc.nist.gov/ns/oscal/1.0).
  #
  # @example
  #   # Get register for OSCAL 1.2.1
  #   register = Oscal::VersionRegistry.register_for_version("1.2.1")
  #
  # @example
  #   # Detect version from an OSCAL document
  #   version = Oscal::VersionRegistry.detect_version(xml_string)
  module VersionRegistry
    @versions = {}

    class << self
      # Register a version module.
      #
      # @param version [String] OSCAL version string (e.g., "1.2.1")
      # @param mod [Module] The version module (e.g., Oscal::V1_2_1)
      def register_version(version, mod)
        @versions = @versions.merge(version => mod)
      end

      # Get the version module for a version string.
      #
      # @param version [String] OSCAL version string
      # @return [Module, nil]
      def version_module(version)
        @versions[version]
      end

      # Get the register for a specific OSCAL version.
      #
      # @param version [String] OSCAL version string
      # @return [Lutaml::Model::Register, nil]
      def register_for_version(version)
        mod = @versions[version]
        return nil unless mod

        mod.init_models! unless mod.initialized?
        mod.register
      end

      # Get the latest registered version module.
      #
      # @return [Module, nil]
      def latest_module
        return nil if @versions.empty?

        @versions.values.last
      end

      # Get the latest register (initializes if needed).
      #
      # @return [Lutaml::Model::Register, nil]
      def latest_register
        mod = latest_module
        return nil unless mod

        mod.init_models! unless mod.initialized?
        mod.register
      end

      # All registered version strings, sorted.
      #
      # @return [Array<String>]
      def available_versions
        @versions.keys.sort
      end

      # Detect OSCAL version from a document string (XML, JSON, or YAML).
      #
      # Looks for the "oscal-version" field in the document's metadata.
      #
      # @param content [String] Document content
      # @return [String, nil] Detected version string
      def detect_version(content)
        return nil if content.nil? || content.strip.empty?

        if content.lstrip.start_with?("<")
          detect_version_xml(content)
        elsif content.lstrip.start_with?("{")
          detect_version_json(content)
        else
          detect_version_yaml(content)
        end
      rescue StandardError
        nil
      end

      # Detect the root model type from a document.
      #
      # @param content [String] Document content
      # @return [Symbol, nil] Model type (:catalog, :profile, etc.)
      def detect_model_type(content)
        return nil if content.nil? || content.strip.empty?

        if content.lstrip.start_with?("<")
          detect_model_type_xml(content)
        elsif content.lstrip.start_with?("{")
          detect_model_type_json(content)
        else
          detect_model_type_yaml(content)
        end
      rescue StandardError
        nil
      end

      private

      def detect_version_xml(xml)
        doc = Nokogiri::XML(xml, &:noblanks)
        node = doc.at_xpath("//*[local-name()='oscal-version']")
        node&.text&.strip
      end

      def detect_version_json(json_str)
        data = JSON.parse(json_str)
        # OSCAL JSON wraps in a root key
        root_key = data.keys.first
        metadata = data[root_key]&.dig("metadata")
        metadata&.dig("oscal-version")
      end

      def detect_version_yaml(yaml_str)
        require "yaml"
        data = YAML.safe_load(yaml_str, permitted_classes: [Date, Time, Symbol])
        return nil unless data.is_a?(Hash)

        root_key = data.keys.first
        metadata = data[root_key]&.dig("metadata")
        metadata&.dig("oscal-version")
      end

      ROOT_ELEMENTS = %w[
        catalog profile component-definition
        system-security-plan assessment-plan
        assessment-results plan-of-action-and-milestones
        mapping-collection
      ].freeze

      ROOT_KEY_MAP = {
        "catalog" => :catalog,
        "profile" => :profile,
        "component-definition" => :component_definition,
        "system-security-plan" => :system_security_plan,
        "assessment-plan" => :assessment_plan,
        "assessment-results" => :assessment_results,
        "plan-of-action-and-milestones" => :plan_of_action_and_milestones,
        "mapping-collection" => :mapping_collection,
      }.freeze

      def detect_model_type_xml(xml)
        doc = Nokogiri::XML(xml, &:noblanks)
        root_name = doc.root&.name
        ROOT_KEY_MAP[root_name]
      end

      def detect_model_type_json(json_str)
        data = JSON.parse(json_str)
        root_key = data.keys.first
        ROOT_KEY_MAP[root_key]
      end

      def detect_model_type_yaml(yaml_str)
        require "yaml"
        data = YAML.safe_load(yaml_str, permitted_classes: [Date, Time, Symbol])
        return nil unless data.is_a?(Hash)

        root_key = data.keys.first
        ROOT_KEY_MAP[root_key]
      end
    end
  end
end
