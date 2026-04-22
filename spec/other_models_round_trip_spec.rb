# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Other OSCAL models round-trip" do
  def minimal_xml(root_element, namespace: "http://csrc.nist.gov/ns/oscal/1.0")
    <<~XML
      <#{root_element} xmlns="#{namespace}">
        <metadata>
          <title>Test #{root_element}</title>
          <last-modified>2024-01-01T00:00:00Z</last-modified>
          <version>1.0</version>
          <oscal-version>1.2.1</oscal-version>
        </metadata>
      </#{root_element}>
    XML
  end

  {
    "AssessmentPlan" => "assessment-plan",
    "AssessmentResults" => "assessment-results",
    "PlanOfActionAndMilestones" => "plan-of-action-and-milestones",
    "MappingCollection" => "mapping-collection",
  }.each do |class_name, root_element|
    describe class_name do
      let(:klass) { Oscal.const_get(class_name) }
      let(:xml)   { minimal_xml(root_element) }

      it "parses and round-trips #{class_name}" do
        instance = klass.from_xml(xml)
        expect(instance).to be_a(Oscal::V1_2_1.const_get(class_name))
        expect(OscalContent.title_text(instance)).to include("Test")

        xml_out = klass.to_xml(instance)
        instance2 = klass.from_xml(xml_out)
        expect(OscalContent.title_text(instance2)).to eq(OscalContent.title_text(instance))
      end
    end
  end

  describe "Oscal.parse auto-detection" do
    it "auto-detects catalog from XML" do
      catalog = Oscal.parse(OscalContent.basic_catalog_xml)
      expect(catalog).to be_a(Oscal::V1_2_1::Catalog)
    end

    it "parses with explicit model type" do
      xml = minimal_xml("profile")
      profile = Oscal.parse(xml, model: :profile)
      expect(profile).to be_a(Oscal::V1_2_1::Profile)
    end

    it "auto-detects from minimal SSP XML" do
      xml = minimal_xml("system-security-plan")
      ssp = Oscal.parse(xml)
      expect(ssp).to be_a(Oscal::V1_2_1::SystemSecurityPlan)
    end

    it "auto-detects from minimal component-definition XML" do
      xml = minimal_xml("component-definition")
      comp = Oscal.parse(xml)
      expect(comp).to be_a(Oscal::V1_2_1::ComponentDefinition)
    end
  end
end
