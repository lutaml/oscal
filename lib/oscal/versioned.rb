# frozen_string_literal: true

module Oscal
  # Base module for version-specific OSCAL model trees.
  #
  # Each version module (V1_2_1, V1_3_0, etc.) extends this
  # and provides its own register.
  #
  # Unlike XMI which uses namespace-based version detection, OSCAL
  # uses schema-version-based detection (the <oscal-version> element
  # in metadata). All OSCAL versions share the same XML namespace.
  #
  # @example
  #   module Oscal::V1_2_1
  #     extend Oscal::Versioned
  #
  #     def self.register_id
  #       :oscal_1_2_1
  #     end
  #
  #     def self.oscal_version
  #       "1.2.1"
  #     end
  #
  #     def self.fallback_registers
  #       %i[oscal_common default]
  #     end
  #
  #     def self.register_models!
  #       # Load pre-generated or runtime-generated classes
  #     end
  #   end
  module Versioned
    def self.extended(base)
      base.instance_eval do
        @register = nil
        @initialized = false
      end
    end

    # The version-specific register for type resolution.
    def register
      @register ||= create_register
    end

    # Create and configure the register with fallback chain.
    def create_register
      reg = Lutaml::Model::Register.new(register_id,
                                        fallback: fallback_registers)
      Lutaml::Model::GlobalRegister.register(reg)
      reg
    end

    # Initialize this version's model tree. Safe to call multiple times.
    def init_models!
      return if @initialized

      register
      register_models!
      @initialized = true
    end

    # Override in each version module to load/register model classes.
    def register_models!
      raise NotImplementedError, "Each version must implement #register_models!"
    end

    # Override: the register ID symbol for this version.
    def register_id
      raise NotImplementedError, "Each version must implement #register_id"
    end

    # Override: the OSCAL version string (e.g., "1.2.1").
    def oscal_version
      raise NotImplementedError, "Each version must implement #oscal_version"
    end

    # Override: fallback register IDs for type resolution.
    # Default chain: common types, then global default.
    def fallback_registers
      %i[oscal_common default]
    end

    def initialized?
      @initialized
    end
  end
end
