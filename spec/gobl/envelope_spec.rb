# frozen_string_literal: true

require_relative '../../lib/gobl'

RSpec.describe GOBL::Envelope do
  it 'creates a new invoice envelope from a JSON' do
    gobl = File.read('spec/example/basic_invoice.json')
    envelope = described_class.from_json!(gobl)

    # puts "ENVELOPE: #{envelope.doc.inspect}"
    invoice = envelope.extract

    expect(invoice.code).to eq('FAKE20220001')
  end

  it 'creates a new message envelope from a JSON' do
    gobl = File.read('spec/example/message_envelope.json')
    envelope = described_class.from_json!(gobl)

    msg = envelope.extract

    expect(msg.content).to eq('This is a test message with some random *markdown* contents.')
  end
end
