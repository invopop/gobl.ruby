# frozen_string_literal: true

require_relative '../../lib/gobl'

RSpec.describe GOBL::Document do
  it 'extracts documents without calculated fields' do
    gobl = File.read('spec/example/uncalculated_invoice.json')
    doc = described_class.from_json!(gobl)

    invoice = doc.extract

    expect(invoice.code).to eq('SAMPLE-001')
    expect(invoice.totals).to be_blank # Totals are calculated and missing in the document
  end
end
