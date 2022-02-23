# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe GOBL::Tax::Region do
  it 'loads region data' do
    region = described_class.fetch('ES')
    expect(region.name.en).to eq('Spain')
    region = described_class.fetch('ES')
    expect(region.name.es).to eq('España')
  end
end
