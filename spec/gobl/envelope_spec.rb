# frozen_string_literal: true

require_relative '../../lib/gobl'

RSpec.describe GOBL::Envelope do
  it 'creates a new invoice envelope from a JSON' do
    gobl = File.read('spec/example/invoice-es-es-freelance.json')
    envelope = described_class.from_json!(gobl)

    # puts "ENVELOPE: #{envelope.doc.inspect}"
    invoice = envelope.extract

    expect(invoice.code).to eq('SAMPLE-001')
    expect(invoice.lines).not_to be_empty
    l1 = invoice.lines[0]
    expect(l1.item.name).to eq('Development services')
  end

  it 'creates a new message envelope from a JSON' do
    gobl = File.read('spec/example/message_envelope.json')
    envelope = described_class.from_json!(gobl)

    msg = envelope.extract

    expect(msg.content).to eq('This is a test message with some random *markdown* contents.')
  end
end
