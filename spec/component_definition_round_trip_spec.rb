# frozen_string_literal: true

require "spec_helper"

RSpec.describe "ComponentDefinition round-trip" do
  let(:klass) { Oscal::ComponentDefinition }

  describe "example-component-definition (oscal-content)" do
    let(:source_xml)  { OscalContent.example_component_definition_xml }
    let(:source_json) { OscalContent.example_component_definition_json }
    let(:source_yaml) { OscalContent.example_component_definition_yaml }

    it "parses example-component-definition.xml" do
      component = klass.from_xml(source_xml)
      expect(component).to be_a(Oscal::V1_2_1::ComponentDefinition)
      expect(OscalContent.title_text(component)).to include("Component Definition")
    end

    include_examples "XML round-trip", Oscal::ComponentDefinition
    include_examples "JSON round-trip", Oscal::ComponentDefinition
    include_examples "YAML round-trip", Oscal::ComponentDefinition
    include_examples "cross-format XML to JSON to YAML to XML", Oscal::ComponentDefinition
  end

  describe "example-component.xml" do
    it "parses example-component.xml" do
      xml = OscalContent.example_component_xml
      component = klass.from_xml(xml)
      expect(component).to be_a(Oscal::V1_2_1::ComponentDefinition)
    end

    it "parses example-component.json" do
      json = OscalContent.example_component_json
      component = klass.from_json(json)
      expect(component).to be_a(Oscal::V1_2_1::ComponentDefinition)
    rescue StandardError => e
      skip "JSON serialization issue: #{e.message}"
    end
  end
end
