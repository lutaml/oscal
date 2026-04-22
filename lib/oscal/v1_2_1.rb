# frozen_string_literal: true

require "metaschema"

module Oscal
  # OSCAL 1.2.1 version module.
  #
  # Contains all model classes for OSCAL version 1.2.1.
  # Classes are pre-generated from the OSCAL metaschema and loaded
  # from lib/oscal/v1_2_1/*.rb.
  module V1_2_1
    extend Oscal::Versioned

    def self.register_id
      :oscal_1_2_1
    end

    def self.oscal_version
      "1.2.1"
    end

    def self.fallback_registers
      %i[oscal_common default]
    end

    # Maps clean class names to ModelGenerator keys.
    ROOT_CLASS_KEYS = {
      "Catalog" => "Assembly_catalog",
      "Profile" => "Assembly_profile",
      "ComponentDefinition" => "Assembly_component_definition",
      "SystemSecurityPlan" => "Assembly_system_security_plan",
      "AssessmentPlan" => "Assembly_assessment_plan",
      "AssessmentResults" => "Assembly_assessment_results",
      "PlanOfActionAndMilestones" => "Assembly_plan_of_action_and_milestones",
      "MappingCollection" => "Assembly_mapping_collection",
    }.freeze

    def self.register_models!
      load_pre_generated
    end

    # Load pre-generated model files from lib/oscal/v1_2_1/
    def self.load_pre_generated
      dir = File.join(__dir__, "v1_2_1")
      if Dir.exist?(dir) && !Dir.empty?(dir)
        Dir[File.join(dir, "*.rb")].sort.each { |f| require f }
      else
        # Fall back to runtime generation if pre-generated files don't exist
        generate_runtime
      end

      # Register all classes with the version register
      register_all_classes
    end

    # Generate classes at runtime from the OSCAL metaschema.
    def self.generate_runtime
      metaschema_path = find_metaschema("oscal_complete_metaschema.xml")
      return unless metaschema_path

      @runtime_classes = Metaschema::ModelGenerator.generate_from_file(metaschema_path)

      # Expose as constants on this module
      @runtime_classes.each do |key, klass|
        const_name = class_key_to_const_name(key)
        const_set(const_name, klass) unless const_defined?(const_name)
      end
    end

    # Register all loaded classes with this version's register.
    def self.register_all_classes
      constants.each do |const_name|
        klass = const_get(const_name)
        next unless klass.is_a?(Class) && klass < Lutaml::Model::Serializable

        register.register_model(klass)
      end
    end

    # Resolve a class by clean name or ModelGenerator key.
    def self.resolve_class(name)
      const_get(name) if const_defined?(name)
    end

    private

    def self.find_metaschema(filename)
      paths = [
        # Local submodule first
        File.expand_path("../../fixtures/oscal/src/metaschema/#{filename}", __dir__),
        # Sibling metaschema repo
        File.expand_path("../../../metaschema/spec/fixtures/oscal/src/metaschema/#{filename}", __dir__),
        File.expand_path("../../../../metaschema/spec/fixtures/oscal/src/metaschema/#{filename}", __dir__),
      ]

      paths.find { |p| File.exist?(p) }
    end

    def self.class_key_to_const_name(key)
      parts = key.sub(/\A(Assembly|Field|Flag)_/, "").split("_")
      name = parts.map(&:capitalize).join
      # Avoid conflicts with Ruby built-ins
      name = "#{name}Field" if %w[Hash Method Object Class Module].include?(name)
      name
    end
  end

  VersionRegistry.register_version("1.2.1", V1_2_1)
end
