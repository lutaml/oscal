# Adding a New OSCAL Version

This guide explains how to add support for a new OSCAL version (e.g., 1.3.0)
to the `oscal` gem.

## Prerequisites

- The `metaschema` gem must be available (installed or at `../metaschema`)
- The OSCAL metaschema XML files for the new version must be present in
  `metaschema/spec/fixtures/oscal/src/metaschema/`

## Steps

### 1. Create the version module

Create `lib/oscal/v1_3_0.rb` (adjust version numbers as needed):

```ruby
# frozen_string_literal: true

require "metaschema"

module Oscal
  module V1_3_0
    extend Oscal::Versioned

    def self.register_id
      :oscal_1_3_0
    end

    def self.oscal_version
      "1.3.0"
    end

    def self.fallback_registers
      %i[oscal_common default]
    end

    def self.register_models!
      load_pre_generated
    end

    def self.load_pre_generated
      dir = File.join(__dir__, "v1_3_0")
      if Dir.exist?(dir) && !Dir.empty?(dir)
        Dir[File.join(dir, "*.rb")].sort.each { |f| require f }
      else
        generate_runtime
      end
      register_all_classes
    end

    def self.generate_runtime
      metaschema_path = find_metaschema("oscal_complete_metaschema.xml")
      return unless metaschema_path

      @runtime_classes = Metaschema::ModelGenerator.generate_from_file(metaschema_path)
      @runtime_classes.each do |key, klass|
        const_name = class_key_to_const_name(key)
        const_set(const_name, klass) unless const_defined?(const_name)
      end
    end

    def self.register_all_classes
      constants.each do |const_name|
        klass = const_get(const_name)
        next unless klass.is_a?(Class) && klass < Lutaml::Model::Serializable
        register.register_model(klass)
      end
    end

    def self.resolve_class(name)
      const_get(name) if const_defined?(name)
    end

    private

    def self.find_metaschema(filename)
      paths = [
        File.expand_path("../../../metaschema/spec/fixtures/oscal/src/metaschema/#{filename}", __dir__),
        File.expand_path("../../../../metaschema/spec/fixtures/oscal/src/metaschema/#{filename}", __dir__),
      ]
      paths.find { |p| File.exist?(p) }
    end

    def self.class_key_to_const_name(key)
      parts = key.sub(/\A(Assembly|Field|Flag)_/, "").split("_")
      name = parts.map(&:capitalize).join
      name = "#{name}Field" if %w[Base Hash Method Object Class Module].include?(name)
      name
    end
  end

  VersionRegistry.register_version("1.3.0", V1_3_0)
end
```

### 2. Generate the pre-built model files

Run the Rake task to generate `lib/oscal/v1_3_0/all_models.rb` from the metaschema:

```bash
bundle exec rake oscal:generate[1.3.0]
```

This produces a single file containing:
- A `Base` class with `lutaml_default_register` pointing to `:oscal_1_3_0`
- All model classes inheriting from `Base`
- XML and key-value (JSON/YAML/TOML) mappings
- Symbol-based type references (`:metadata`, `:control`) for register-swappability

### 3. Wire up the default version (optional)

If this is the latest version, update `lib/oscal.rb` to load it by default:

```ruby
def default_version_module
  @default_version_module ||= begin
    require_relative "oscal/v1_3_0"  # Update this line
    VersionRegistry.latest_module
  end
end
```

### 4. Add tests

Create `spec/round_trip_spec.rb` entries for the new version, or create a new
spec file following the existing pattern.

## Architecture Notes

### Register System

Each OSCAL version gets its own `Lutaml::Model::Register`:

- **Register ID**: `:oscal_1_3_0` (derived from module name)
- **Fallback chain**: `:oscal_common` → `:default`
- **Type resolution**: Symbol references like `:metadata` resolve through the
  version's register, enabling version swappability

### Type References

Generated code uses three kinds of type references:

| Kind | Example | When |
|------|---------|------|
| Builtin symbols | `:string`, `:integer` | Primitive types |
| Generated type symbols | `:metadata`, `:control` | OSCAL model types |
| Bare class references | `Metaschema::AnchorType` | Framework types from other gems |

### Reserved Class Names

The emitter renames classes that would conflict with Ruby built-ins or the
module's `Base` class:

- `Base` → `BaseField`
- `Hash` → `HashField`
- `Method`, `Object`, `Class`, `Module` → `{Name}Field`
