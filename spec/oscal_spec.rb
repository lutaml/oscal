# frozen_string_literal: true

RSpec.describe Oscal do
  it "has a version number" do
    expect(Oscal::VERSION).not_to be nil
  end

  it "registers OSCAL 1.2.1 version after loading" do
    Oscal.default_version_module
    expect(Oscal::VersionRegistry.available_versions).to include("1.2.1")
  end

  it "lazy-loads the default version module" do
    mod = Oscal.default_version_module
    expect(mod).to eq(Oscal::V1_2_1)
    expect(mod.oscal_version).to eq("1.2.1")
  end

  it "generates all 122 OSCAL model classes" do
    mod = Oscal.default_version_module
    mod.init_models!
    classes = mod.constants.select { |c| mod.const_get(c).is_a?(Class) }
    expect(classes.length).to be >= 100
  end

  it "exposes all 8 root model types" do
    mod = Oscal.default_version_module
    mod.init_models!
    %w[Catalog Profile ComponentDefinition SystemSecurityPlan
       AssessmentPlan AssessmentResults PlanOfActionAndMilestones
       MappingCollection].each do |name|
      expect(mod.const_defined?(name)).to be true
    end
  end

  it "parses a catalog from XML" do
    mod = Oscal.default_version_module
    mod.init_models!
    catalog_klass = mod.resolve_class("Catalog")

    xml = <<~XML
      <catalog xmlns="http://csrc.nist.gov/ns/oscal/1.0">
        <metadata>
          <title>Test Catalog</title>
          <last-modified>2024-01-01T00:00:00Z</last-modified>
          <version>1.0</version>
          <oscal-version>1.2.1</oscal-version>
        </metadata>
      </catalog>
    XML

    catalog = catalog_klass.from_xml(xml)
    title = catalog.metadata.title.content
    title = title.join if title.is_a?(Array)
    expect(title).to eq("Test Catalog")
  end

  it "detects version from XML" do
    xml = <<~XML
      <catalog xmlns="http://csrc.nist.gov/ns/oscal/1.0">
        <metadata>
          <oscal-version>1.2.1</oscal-version>
        </metadata>
      </catalog>
    XML
    expect(Oscal::VersionRegistry.detect_version(xml)).to eq("1.2.1")
  end

  it "detects version from JSON" do
    json = '{"catalog":{"metadata":{"oscal-version":"1.2.1"}}}'
    expect(Oscal::VersionRegistry.detect_version(json)).to eq("1.2.1")
  end

  it "detects model type from XML" do
    xml = '<catalog xmlns="http://csrc.nist.gov/ns/oscal/1.0"/>'
    expect(Oscal::VersionRegistry.detect_model_type(xml)).to eq(:catalog)
  end

  it "detects model type from JSON" do
    json = '{"profile":{"metadata":{}}}'
    expect(Oscal::VersionRegistry.detect_model_type(json)).to eq(:profile)
  end
end
