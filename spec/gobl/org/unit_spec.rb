# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe GOBL::Org::Unit do
  it 'allows to create a unit with an invalid value' do
    obj = 'pts'
    unit = described_class.from_json!(obj.to_json)

    expect(unit.to_s).to eq('pts')
    expect(unit.description).to eq('pts')
  end
end
