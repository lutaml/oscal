# frozen_string_literal: true

require "spec_helper"
require "json"

RSpec.describe "OSCAL inline markup serialization" do
  let(:catalog) { Oscal::V1_2_1::Catalog.from_xml(OscalContent.basic_catalog_xml) }

  it "serializes a title with inline markup as a bare Markdown string" do
    json = JSON.parse(Oscal::V1_2_1::Catalog.to_json(catalog))
    title = json.dig("catalog", "metadata", "title")
    expect(title).to be_a(String)
    expect(title).not_to include("content")
  end

  it "round-trips inline markup through JSON back to equivalent title text" do
    json = Oscal::V1_2_1::Catalog.to_json(catalog)
    from_json = Oscal::V1_2_1::Catalog.from_json(json)
    expect(OscalContent.title_text(from_json))
      .to eq(OscalContent.title_text(catalog))
  end
end
