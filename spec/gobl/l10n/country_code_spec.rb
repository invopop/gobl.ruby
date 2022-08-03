# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe GOBL::L10n::CountryCode do
  it 'creates a new country code from a JSON' do
    obj = 'ES'
    any = described_class.from_json!(obj.to_json)

    expect(any.to_s).to eq('ES')
  end
end
