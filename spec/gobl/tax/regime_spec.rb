# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe GOBL::Tax::Regime do
  describe 'extensions' do
    it 'loads regime data' do
      regime = described_class.fetch('ES')
      expect(regime.name.en).to eq('Spain')
      regime = described_class.fetch('ES')
      expect(regime.name.es).to eq('España')
    end
  end
end
