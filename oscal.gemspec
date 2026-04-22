# frozen_string_literal: true

require_relative "lib/oscal/version"

Gem::Specification.new do |spec|
  spec.name = "oscal"
  spec.version = Oscal::VERSION
  spec.authors = ["Ribose Inc."]
  spec.email = ["open.source@ribose.com"]

  spec.summary = "OSCAL Ruby models with multi-version support"
  spec.description = "Ruby library for OSCAL (Open Security Controls Assessment Language) models. " \
                     "Supports XML, JSON, and YAML serialization via metaschema-driven generation."
  spec.homepage = "https://github.com/lutaml/oscal-ruby/"
  spec.license = "BSD-2-Clause"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/lutaml/oscal-ruby/"
  spec.metadata["changelog_uri"] = "https://github.com/lutaml/oscal-ruby/CHANGELOG"

  spec.files = Dir["lib/**/*.rb", "lib/**/*.xml"]
  spec.bindir = "exe"
  spec.require_paths = ["lib"]
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  spec.add_dependency "lutaml-model", "~> 0.8.0"
  spec.add_dependency "metaschema", "~> 0.2.0"

  spec.metadata["rubygems_mfa_required"] = "true"
end
