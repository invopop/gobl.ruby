# frozen_string_literal: true

require './lib/gobl'

RSpec.describe 'Generated Object' do
  let(:object_class) { GOBL::Note::Message }

  it 'creates a new object from a JSON' do
    json = { 'content' => 'Testing Message' }.to_json
    object = object_class.from_json!(json)

    expect(object.content).to eq('Testing Message')
  end

  it 'converts an object into a JSON' do
    json = { 'title' => nil, 'content' => 'Testing Message', 'meta' => nil }.to_json
    object = object_class.from_json!(json)

    expect(object.to_json).to eq(json)
  end
end
