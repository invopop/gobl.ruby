# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe GOBL::Org::Unit do
  it 'allows to create a unit with an invalid value' do
    obj = 'pts'
    unit = described_class.from_json!(obj.to_json)

    expect(unit.to_s).to eq('pts')
    expect(unit.description).to eq('pts')
  end

  it 'allows to inquire about the enumerated values' do
    obj = 'day'
    unit = described_class.from_json!(obj.to_json)

    expect(unit.day?).to eq(true)
    expect(unit.min?).to eq(false)

    expect(unit).to respond_to(:day?)
    expect(unit).to respond_to(:min?)
    expect(unit).to_not respond_to(:pts?)
  end
end
