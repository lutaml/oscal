# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Profile round-trip" do
  let(:klass) { Oscal::Profile }

  describe "OSCAL profile-resolution fixtures" do
    %w[
      full-test base-test include-all-test include-match-test
      modify-adds merge-keep exclude-call-test import-twice
    ].each do |name|
      describe "#{name}_profile.xml" do
        let(:source_xml) { OscalContent.oscal_profile(name) }

        it "parses and round-trips #{name}" do
          skip "Fixture not found" unless source_xml
          profile = klass.from_xml(source_xml)
          expect(profile).to be_a(Oscal::V1_2_1::Profile)

          xml_out = klass.to_xml(profile)
          profile2 = klass.from_xml(xml_out)
          expect(OscalContent.title_text(profile2)).to eq(OscalContent.title_text(profile))
        end
      end
    end
  end

  describe "NIST SP 800-53 Rev4 profiles", nist: true do
    describe "MODERATE baseline" do
      let(:source_xml)  { OscalContent.nist_profile_xml("rev4", "MODERATE") }
      let(:source_json) { OscalContent.nist_profile_json("rev4", "MODERATE") }
      let(:source_yaml) { OscalContent.nist_profile_yaml("rev4", "MODERATE") }

      it "parses NIST Rev4 MODERATE profile XML" do
        profile = klass.from_xml(source_xml)
        expect(profile).to be_a(Oscal::V1_2_1::Profile)
        expect(OscalContent.title_text(profile)).to include("800-53")
      end

      it "parses NIST Rev4 MODERATE profile JSON" do
        profile = klass.from_json(source_json)
        expect(profile).to be_a(Oscal::V1_2_1::Profile)
      end

      it "parses NIST Rev4 MODERATE profile YAML" do
        profile = klass.from_yaml(source_yaml)
        expect(profile).to be_a(Oscal::V1_2_1::Profile)
      end

      it "round-trips NIST Rev4 MODERATE XML", slow: true do
        profile = klass.from_xml(source_xml)
        xml_out = klass.to_xml(profile)
        profile2 = klass.from_xml(xml_out)
        expect(OscalContent.title_text(profile2)).to eq(OscalContent.title_text(profile))
      end
    end

    %w[LOW HIGH].each do |baseline|
      it "parses NIST Rev4 #{baseline} profile XML" do
        xml = OscalContent.nist_profile_xml("rev4", baseline)
        profile = klass.from_xml(xml)
        expect(profile).to be_a(Oscal::V1_2_1::Profile)
      end
    end
  end

  describe "NIST SP 800-53 Rev5 profiles", nist: true do
    describe "MODERATE baseline" do
      let(:source_xml)  { OscalContent.nist_profile_xml("rev5", "MODERATE") }
      let(:source_json) { OscalContent.nist_profile_json("rev5", "MODERATE") }

      it "parses NIST Rev5 MODERATE profile XML" do
        profile = klass.from_xml(source_xml)
        expect(profile).to be_a(Oscal::V1_2_1::Profile)
        expect(OscalContent.title_text(profile)).to include("800-53")
      end

      it "parses NIST Rev5 MODERATE profile JSON" do
        profile = klass.from_json(source_json)
        expect(profile).to be_a(Oscal::V1_2_1::Profile)
      end
    end

    %w[LOW HIGH PRIVACY].each do |baseline|
      it "parses NIST Rev5 #{baseline} profile XML" do
        xml = OscalContent.nist_profile_xml("rev5", baseline)
        profile = klass.from_xml(xml)
        expect(profile).to be_a(Oscal::V1_2_1::Profile)
      end
    end
  end
end
