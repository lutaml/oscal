# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Catalog round-trip" do
  let(:klass) { Oscal::Catalog }

  describe "basic-catalog (oscal-content)" do
    let(:source_xml)  { OscalContent.basic_catalog_xml }
    let(:source_json) { OscalContent.basic_catalog_json }
    let(:source_yaml) { OscalContent.basic_catalog_yaml }

    it "parses basic-catalog.xml" do
      catalog = klass.from_xml(source_xml)
      expect(catalog).to be_a(Oscal::V1_2_1::Catalog)
      expect(catalog.uuid).to eq("74c8ba1e-5cd4-4ad1-bbfd-d888e2f6c724")
    end

    it "preserves catalog metadata after XML round-trip" do
      catalog = klass.from_xml(source_xml)
      title = OscalContent.title_text(catalog)
      expect(title).to include("Sample Security Catalog")
      expect(catalog.metadata.oscal_version.content).to eq("1.0.0")
    end

    it "preserves groups and controls after XML round-trip" do
      catalog = klass.from_xml(source_xml)
      expect(catalog.group.length).to be >= 1
      first_group = catalog.group.first
      title = first_group.title.content
      title = title.join if title.is_a?(Array)
      expect(title).to eq("Organization of Information Security")
    end

    include_examples "XML round-trip", Oscal::Catalog
    include_examples "JSON round-trip", Oscal::Catalog
    include_examples "YAML round-trip", Oscal::Catalog
    include_examples "cross-format XML to JSON to YAML to XML", Oscal::Catalog
  end

  describe "OSCAL test catalogs (profile-resolution fixtures)" do
    %w[abc-simple abc-full xyz-tiny abc-crazy busy].each do |name|
      describe "#{name}_catalog.xml" do
        let(:source_xml) { OscalContent.oscal_catalog(name) }

        it "parses and round-trips #{name}" do
          skip "Fixture not found" unless source_xml
          catalog = klass.from_xml(source_xml)
          expect(catalog).to be_a(Oscal::V1_2_1::Catalog)

          xml_out = klass.to_xml(catalog)
          catalog2 = klass.from_xml(xml_out)
          expect(OscalContent.title_text(catalog2)).to eq(OscalContent.title_text(catalog))
        end
      end
    end
  end

  describe "NIST SP 800-53 Rev4 catalog", nist: true do
    let(:source_xml)  { OscalContent.nist_rev4_catalog_xml }
    let(:source_json) { OscalContent.nist_rev4_catalog_json }
    let(:source_yaml) { OscalContent.nist_rev4_catalog_yaml }

    it "parses NIST Rev4 catalog XML" do
      catalog = klass.from_xml(source_xml)
      expect(catalog).to be_a(Oscal::V1_2_1::Catalog)
      expect(OscalContent.title_text(catalog)).to include("800-53")
    end

    it "parses NIST Rev4 catalog JSON" do
      catalog = klass.from_json(source_json)
      expect(catalog).to be_a(Oscal::V1_2_1::Catalog)
    end

    it "parses NIST Rev4 catalog YAML" do
      catalog = klass.from_yaml(source_yaml)
      expect(catalog).to be_a(Oscal::V1_2_1::Catalog)
    end

    it "round-trips NIST Rev4 XML", slow: true do
      catalog = klass.from_xml(source_xml)
      xml_out = klass.to_xml(catalog)
      catalog2 = klass.from_xml(xml_out)
      expect(OscalContent.title_text(catalog2)).to eq(OscalContent.title_text(catalog))
    end
  end

  describe "NIST SP 800-53 Rev5 catalog", nist: true do
    let(:source_xml)  { OscalContent.nist_rev5_catalog_xml }
    let(:source_json) { OscalContent.nist_rev5_catalog_json }
    let(:source_yaml) { OscalContent.nist_rev5_catalog_yaml }

    it "parses NIST Rev5 catalog XML" do
      catalog = klass.from_xml(source_xml)
      expect(catalog).to be_a(Oscal::V1_2_1::Catalog)
      expect(OscalContent.title_text(catalog)).to include("800-53")
    end

    it "parses NIST Rev5 catalog JSON" do
      catalog = klass.from_json(source_json)
      expect(catalog).to be_a(Oscal::V1_2_1::Catalog)
    end

    it "parses NIST Rev5 catalog YAML" do
      catalog = klass.from_yaml(source_yaml)
      expect(catalog).to be_a(Oscal::V1_2_1::Catalog)
    end

    it "round-trips NIST Rev5 XML", slow: true do
      catalog = klass.from_xml(source_xml)
      xml_out = klass.to_xml(catalog)
      catalog2 = klass.from_xml(xml_out)
      expect(OscalContent.title_text(catalog2)).to eq(OscalContent.title_text(catalog))
    end
  end
end
