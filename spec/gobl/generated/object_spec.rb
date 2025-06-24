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

  it 'validates the presence of mandatory and non-calculated fields' do
    invoice = object_class.new
    expect(invoice).not_to be_valid
    expect(invoice.errors.full_messages).to include("Supplier can't be blank") # `supplier` is mandatory and not calculated
    expect(invoice.errors.full_messages).not_to include("Totals can't be blank") # `totals` is mandatory but calculated
  end

  it 'validates the inclusion of enumerated keys in the allowed values' do
    invoice = object_class.new(type: 'strange-type')
    expect(invoice).not_to be_valid
    expect(invoice.errors.full_messages).to include('Type is not included in the list')
  end

  it 'validates nested objects' do
    invoice = object_class.new(payment: { instructions: {} }, currency: 'XXX')
    expect(invoice).not_to be_valid

    expect(invoice.errors.full_messages).to include('Payment is invalid') # `payment` is a nested struct
    expect(invoice.payment.errors.full_messages).to include('Instructions is invalid')
    expect(invoice.payment.instructions.errors.full_messages).to include("Key can't be blank")

    expect(invoice.errors.full_messages).to include('Currency is invalid') # `currency` is an enumerated value
    expect(invoice.currency.errors.full_messages).to include('Value "XXX" is not within the allowed values of the enumeration')
  end

  it 'instatiates from an ‘enhanced’ hash' do
    invoice = object_class.new(
      code: 'SAMPLE-001',
      type: 'standard',
      currency: 'EUR',
      issue_date: Date.new(2021, 1, 1).to_s, # FIXME: Add extensions
      supplier: { tax_id: { country: 'ES', code: '54387763P' }, name: 'Provide One S.L.' },
      customer: { tax_id: { country: 'ES', code: '54387763P' }, name: 'Sample Consumer' },
      lines: [{
        quantity: 20,
        item: { name: 'Development services', price: 90.0 },
        taxes: [{ cat: 'VAT', rate: 'standard' }]
      }]
    )

    expect(invoice).to be_valid

    expect(invoice.code).to eq('SAMPLE-001')
    expect(invoice.currency).to eq(GOBL::Currency::Code.new('EUR'))
    expect(invoice.issue_date).to eq(GOBL::Cal::Date.new('2021-01-01'))

    invoice.supplier.tap do |supplier|
      expect(supplier).to be_a(GOBL::Org::Party)
      expect(supplier.name).to eq('Provide One S.L.')
      expect(supplier.tax_id.country).to eq(GOBL::L10n::TaxCountryCode.new('ES'))
      expect(supplier.tax_id.code).to eq('54387763P')
    end

    invoice.customer.tap do |customer|
      expect(customer).to be_a(GOBL::Org::Party)
      expect(customer.name).to eq('Sample Consumer')
      expect(customer.tax_id.country).to eq(GOBL::L10n::TaxCountryCode.new('ES'))
      expect(customer.tax_id.code).to eq('54387763P')
    end

    invoice.lines.first.tap do |line|
      expect(line).to be_a(GOBL::Bill::Line)
      expect(line.quantity).to eq(GOBL::Num::Amount.new('20.00'))
      expect(line.item.name).to eq('Development services')
      expect(line.item.price).to eq(GOBL::Num::Amount.new('90.00'))

      line.taxes.first.tap do |tax|
        expect(tax).to be_a(GOBL::Tax::Combo)
        expect(tax.cat).to eq(GOBL::CBC::Code.new('VAT'))
        expect(tax.rate).to eq(GOBL::CBC::Key.new('standard'))
      end
    end
  end
end
