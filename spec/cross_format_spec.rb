# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Cross-format round-trip" do
  describe "Catalog" do
    it "round-trips XML → JSON → XML" do
      pending "JSON serialization not fully lossless for complex documents"
      xml = OscalContent.basic_catalog_xml
      catalog = Oscal::Catalog.from_xml(xml)
      json_out = Oscal::Catalog.to_json(catalog)
      from_json = Oscal::Catalog.from_json(json_out)
      xml_out = Oscal::Catalog.to_xml(from_json)

      expect(xml_out).to be_xml_equivalent_to(xml)
    end
  end

  describe "ComponentDefinition" do
    it "round-trips XML → JSON → XML" do
      pending "JSON serialization not fully lossless for complex documents"
      xml = OscalContent.example_component_definition_xml
      component = Oscal::ComponentDefinition.from_xml(xml)
      json_out = Oscal::ComponentDefinition.to_json(component)
      from_json = Oscal::ComponentDefinition.from_json(json_out)
      xml_out = Oscal::ComponentDefinition.to_xml(from_json)

      expect(xml_out).to be_xml_equivalent_to(xml)
    end
  end

  describe "SystemSecurityPlan" do
    it "round-trips XML → JSON → XML" do
      pending "JSON serialization not fully lossless for complex documents"
      xml = OscalContent.ssp_example_xml
      ssp = Oscal::SystemSecurityPlan.from_xml(xml)
      json_out = Oscal::SystemSecurityPlan.to_json(ssp)
      from_json = Oscal::SystemSecurityPlan.from_json(json_out)
      xml_out = Oscal::SystemSecurityPlan.to_xml(from_json)

      expect(xml_out).to be_xml_equivalent_to(xml)
    end
  end

  describe "NIST SP 800-53 Rev4 MODERATE profile", nist: true, slow: true do
    it "round-trips XML → JSON → XML" do
      pending "JSON serialization not fully lossless for complex documents"
      xml = OscalContent.nist_profile_xml("rev4", "MODERATE")
      profile = Oscal::Profile.from_xml(xml)
      json_out = Oscal::Profile.to_json(profile)
      from_json = Oscal::Profile.from_json(json_out)
      xml_out = Oscal::Profile.to_xml(from_json)

      expect(xml_out).to be_xml_equivalent_to(xml)
    end
  end
end
