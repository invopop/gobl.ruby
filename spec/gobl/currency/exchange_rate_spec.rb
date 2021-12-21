# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe GOBL::Currency::ExchangeRate do
  it 'creates a new exchange rate from a JSON' do
    obj = { 'currency' => 'EUR', 'value' => '100' }
    xchg = described_class.from_json!(obj.to_json)

    expect(xchg.value).to eq('100')
  end
end
