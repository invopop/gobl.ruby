# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe GOBL::Note::Message do
  it 'creates a new exchange rate from a GOBL' do
    obj = { 'content' => 'Testing Message' }
    msg = described_class.from_json!(obj.to_json)

    expect(msg.content).to eq('Testing Message')
  end
end
