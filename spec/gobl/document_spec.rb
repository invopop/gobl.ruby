# frozen_string_literal: true

require_relative '../../lib/gobl'

RSpec.describe GOBL::Document do
  describe 'extensions' do
    it 'extracts documents without calculated fields' do
      gobl = File.read('spec/example/uncalculated_invoice.json')
      doc = described_class.from_json!(gobl)

      expect(doc.schema).to eq('https://gobl.org/draft-0/bill/invoice')

      invoice = doc.extract

      expect(invoice.code).to eq('SAMPLE-001')
      expect(invoice.totals).to be_blank # Totals are calculated and missing in the document
    end

    it 'embeds a GOBL struct into a new document' do
      json = File.read('spec/example/uncalculated_invoice.json')
      invoice = GOBL::Bill::Invoice.from_json!(json)

      doc = described_class.embed(invoice)

      expect(doc.schema).to eq('https://gobl.org/draft-0/bill/invoice')
      expect(doc.extract).to eq(invoice)
    end
  end
end
