# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe GOBL::Bill::Invoice do
  it 'can be instatiated from an ‘enhanced’ hash' do
    invoice = GOBL::Bill::Invoice.new(
      code: 'SAMPLE-001',
      currency: :eur,
      issue_date: Date.new(2021, 1, 1),
      supplier: { tax_id: { country: :es, code: '54387763P' }, name: 'Provide One S.L.' },
      customer: { tax_id: { country: :es, code: '54387763P' }, name: 'Sample Consumer' },
      lines: [{
        quantity: 20,
        item: { name: 'Development services', price: 90.0 },
        taxes: [ { cat: 'VAT', rate: :standard } ]
      }]
    )

    expect(invoice.code).to eq('SAMPLE-001')
    expect(invoice.currency).to eq(GOBL::Currency::Code.new('EUR'))
    expect(invoice.issue_date).to eq(GOBL::Cal::Date.new('2021-01-01'))

    invoice.supplier.tap do |supplier|
      expect(supplier).to be_a(GOBL::Org::Party)
      expect(supplier.name).to eq('Provide One S.L.')
      expect(supplier.tax_id.country).to eq(GOBL::L10n::CountryCode.new('ES'))
      expect(supplier.tax_id.code).to eq('54387763P')
    end

    invoice.customer.tap do |customer|
      expect(customer).to be_a(GOBL::Org::Party)
      expect(customer.name).to eq('Sample Consumer')
      expect(customer.tax_id.country).to eq(GOBL::L10n::CountryCode.new('ES'))
      expect(customer.tax_id.code).to eq('54387763P')
    end

    invoice.lines.first.tap do |line|
      expect(line).to be_a(GOBL::Bill::Line)
      expect(line.quantity).to eq(GOBL::Num::Amount.new('20.00'))
      expect(line.item.name).to eq('Development services')
      expect(line.item.price).to eq(GOBL::Num::Amount.new('90.00'))

      line.taxes.first.tap do |tax|
        expect(tax).to be_a(GOBL::Tax::Combo)
        expect(tax.cat).to eq(GOBL::Org::Code.new('VAT'))
        expect(tax.rate).to eq(GOBL::Org::Key.new('standard'))
      end
    end
  end
end
