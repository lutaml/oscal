# frozen_string_literal: true

require "spec_helper"

RSpec.describe "OSCAL round-trip regression" do
  let(:klass) { Oscal::Catalog }

  describe "Catalog XML round-trip" do
    let(:source_xml) { OscalContent.basic_catalog_xml }

    it "parses basic-catalog.xml" do
      catalog = klass.from_xml(source_xml)
      expect(catalog).to be_a(Oscal::V1_2_1::Catalog)
      expect(catalog.uuid).to eq("74c8ba1e-5cd4-4ad1-bbfd-d888e2f6c724")
    end

    include_examples "XML round-trip", Oscal::Catalog
  end

  describe "ComponentDefinition XML round-trip" do
    let(:source_xml) { OscalContent.example_component_definition_xml }

    include_examples "XML round-trip", Oscal::ComponentDefinition
  end

  describe "SystemSecurityPlan XML round-trip" do
    let(:source_xml) { OscalContent.ssp_example_xml }

    include_examples "XML round-trip", Oscal::SystemSecurityPlan
  end
end
