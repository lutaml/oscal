# frozen_string_literal: true

RSpec.shared_examples "XML round-trip" do |model_class|
  it "round-trips XML" do
    instance1 = model_class.from_xml(source_xml)
    xml_out = model_class.to_xml(instance1)
    instance2 = model_class.from_xml(xml_out)

    expect(OscalContent.title_text(instance2)).to eq(OscalContent.title_text(instance1))
  end
end

RSpec.shared_examples "JSON round-trip" do |model_class|
  it "round-trips JSON" do
    instance1 = model_class.from_json(source_json)
    json_out = model_class.to_json(instance1)
    instance2 = model_class.from_json(json_out)

    expect(OscalContent.title_text(instance2)).to eq(OscalContent.title_text(instance1))
  end
end

RSpec.shared_examples "YAML round-trip" do |model_class|
  it "round-trips YAML" do
    instance1 = model_class.from_yaml(source_yaml)
    yaml_out = model_class.to_yaml(instance1)
    instance2 = model_class.from_yaml(yaml_out)

    expect(OscalContent.title_text(instance2)).to eq(OscalContent.title_text(instance1))
  end
end

RSpec.shared_examples "cross-format XML to JSON to YAML to XML" do |model_class|
  it "survives cross-format round-trip" do
    from_xml  = model_class.from_xml(source_xml)
    json_out  = model_class.to_json(from_xml)
    from_json = model_class.from_json(json_out)
    yaml_out  = model_class.to_yaml(from_json)
    from_yaml = model_class.from_yaml(yaml_out)
    xml_final = model_class.to_xml(from_yaml)

    # XML comments cannot survive a JSON/YAML hop (neither format models them),
    # so they are non-normative for a cross-format round-trip; every other
    # dimension stays strict.
    expect(xml_final)
      .to be_xml_equivalent_to(source_xml).with_match(comments: :ignore)
  end
end
