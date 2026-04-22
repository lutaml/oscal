# frozen_string_literal: true

# Centralized path constants and helpers for OSCAL test content.
#
# Two submodules provide test fixtures:
#   spec/oscal-content/  → usnistgov/oscal-content (examples + NIST SP 800-53)
#   spec/fixtures/oscal/ → usnistgov/OSCAL (profile-resolution fixtures)
module OscalContent
  CONTENT_DIR = File.expand_path("../oscal-content", __dir__)
  OSCAL_DIR   = File.expand_path("../fixtures/oscal", __dir__)

  # --- Helpers ---

  # Normalize mixed-content title (Array → String)
  def self.title_text(instance)
    t = instance.metadata.title.content
    t.is_a?(Array) ? t.join : t
  end

  # --- oscal-content examples ---

  # Catalog
  def self.basic_catalog_xml
    File.read(File.join(CONTENT_DIR, "examples/catalog/xml/basic-catalog.xml"))
  end

  def self.basic_catalog_json
    File.read(File.join(CONTENT_DIR, "examples/catalog/json/basic-catalog.json"))
  end

  def self.basic_catalog_yaml
    File.read(File.join(CONTENT_DIR, "examples/catalog/yaml/basic-catalog.yaml"))
  end

  # Component Definition
  def self.example_component_definition_xml
    File.read(File.join(CONTENT_DIR, "examples/component-definition/xml/example-component-definition.xml"))
  end

  def self.example_component_definition_json
    File.read(File.join(CONTENT_DIR, "examples/component-definition/json/example-component-definition.json"))
  end

  def self.example_component_definition_yaml
    File.read(File.join(CONTENT_DIR, "examples/component-definition/yaml/example-component-definition.yaml"))
  end

  def self.example_component_xml
    File.read(File.join(CONTENT_DIR, "examples/component-definition/xml/example-component.xml"))
  end

  def self.example_component_json
    File.read(File.join(CONTENT_DIR, "examples/component-definition/json/example-component.json"))
  end

  # SSP
  def self.ssp_example_xml
    File.read(File.join(CONTENT_DIR, "examples/ssp/xml/ssp-example.xml"))
  end

  def self.ssp_example_json
    File.read(File.join(CONTENT_DIR, "examples/ssp/json/ssp-example.json"))
  end

  def self.ssp_example_yaml
    File.read(File.join(CONTENT_DIR, "examples/ssp/yaml/ssp-example.yaml"))
  end

  def self.ssp_leveraged_xml
    File.read(File.join(CONTENT_DIR, "examples/ssp/xml/oscal_leveraged-example_ssp.xml"))
  end

  def self.ssp_leveraged_json
    File.read(File.join(CONTENT_DIR, "examples/ssp/json/oscal_leveraged-example_ssp.json"))
  end

  def self.ssp_leveraging_xml
    File.read(File.join(CONTENT_DIR, "examples/ssp/xml/oscal_leveraging-example_ssp.xml"))
  end

  def self.ssp_leveraging_json
    File.read(File.join(CONTENT_DIR, "examples/ssp/json/oscal_leveraging-example_ssp.json"))
  end

  # --- NIST SP 800-53 ---

  def self.nist_path(rev, model, format, baseline: nil)
    parts = [CONTENT_DIR, "nist.gov/SP800-53", rev, format]
    if model == :catalog
      parts << "NIST_SP-800-53_#{rev}_catalog.#{format}"
    elsif model == :profile
      parts << "NIST_SP-800-53_#{rev}_#{baseline}-baseline_profile.#{format}"
    elsif model == :resolved_catalog
      parts << "NIST_SP-800-53_#{rev}_#{baseline}-baseline-resolved-profile_catalog.#{format}"
    end
    File.join(parts)
  end

  def self.nist_rev4_catalog_xml
    File.read(nist_path("rev4", :catalog, "xml"))
  end

  def self.nist_rev4_catalog_json
    File.read(nist_path("rev4", :catalog, "json"))
  end

  def self.nist_rev4_catalog_yaml
    File.read(nist_path("rev4", :catalog, "yaml"))
  end

  def self.nist_rev5_catalog_xml
    File.read(nist_path("rev5", :catalog, "xml"))
  end

  def self.nist_rev5_catalog_json
    File.read(nist_path("rev5", :catalog, "json"))
  end

  def self.nist_rev5_catalog_yaml
    File.read(nist_path("rev5", :catalog, "yaml"))
  end

  def self.nist_profile_xml(rev, baseline)
    File.read(nist_path(rev, :profile, "xml", baseline: baseline))
  end

  def self.nist_profile_json(rev, baseline)
    File.read(nist_path(rev, :profile, "json", baseline: baseline))
  end

  def self.nist_profile_yaml(rev, baseline)
    File.read(nist_path(rev, :profile, "yaml", baseline: baseline))
  end

  # --- OSCAL submodule (profile-resolution fixtures, XML only) ---

  PROFILE_RESOLUTION_EXAMPLES = File.join(
    OSCAL_DIR, "src/specifications/profile-resolution/profile-resolution-examples"
  )

  PROFILE_RESOLUTION_TESTS = File.join(
    OSCAL_DIR, "src/specifications/profile-resolution/requirement-tests"
  )

  def self.oscal_catalog(name)
    path = File.join(PROFILE_RESOLUTION_TESTS, "catalogs", "#{name}_catalog.xml")
    File.read(path) if File.exist?(path)
  end

  def self.oscal_profile(name)
    path = File.join(PROFILE_RESOLUTION_EXAMPLES, "#{name}_profile.xml")
    path = File.join(PROFILE_RESOLUTION_TESTS, "#{name}_profile.xml") unless File.exist?(path)
    File.read(path) if File.exist?(path)
  end
end
