# frozen_string_literal: true

require_relative '../../lib/gobl'

RSpec.describe GOBL::Envelope do
  it 'creates a new envelope from a JSON' do
    gobl = File.read('spec/example/basic_envelope.json')
    envelope = described_class.from_json!(gobl)

    expect(envelope.doc.code).to eq('1234')
  end
end
