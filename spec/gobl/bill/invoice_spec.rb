# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe GOBL::Bill::Invoice do
  describe 'extensions' do
    describe 'regime' do
      it 'returns the regime of the invoice' do
        invoice = described_class.new(supplier: { tax_id: { country: 'ES' }})
        expect(invoice.regime.name.en).to eq('Spain')
      end

      it 'returns nil when no supplier is given' do
        invoice = described_class.new(supplier: nil)
        expect(invoice.regime).to be_nil
      end
    end

    describe 'scenario_summmary' do
      it 'returns the scenario summary of the invoice' do
        invoice = described_class.new(
          supplier: { tax_id: { country: 'IT' }},
          type: 'credit-note',
          tax: { tags: ['unknown-tag', 'simplified', 'minimum-tax-payers'] }
        )
        expect(invoice.scenario_summary.codes['fatturapa-tipo-documento']).to eq('TD08')
      end
    end
  end
end
