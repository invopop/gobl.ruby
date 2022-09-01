# frozen_string_literal: true

require './lib/gobl'

RSpec.describe 'Generated Object' do
  let(:object_class) { GOBL::Bill::Invoice }

  it 'creates a new object from a JSON' do
    json = File.read('spec/example/uncalculated_invoice.json')
    object = object_class.from_json!(json)

    expect(object.code).to eq('SAMPLE-001')
  end

  it 'serialises an object into a JSON' do
    orig_json = File.read('spec/example/uncalculated_invoice.json')
    object = object_class.from_json!(orig_json)
    json = object.to_json

    # `$schema` is not an attribute of the object so it’s not expected to be serialised
    expect(JSON.parse(json)).to eq(JSON.parse(orig_json).except('$schema'))
  end
end
