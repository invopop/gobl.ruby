# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe GOBL::I18n::String do
  describe 'extensions' do
    it 'creates a new exchange rate from a JSON' do
      obj = { 'es' => 'name_es', 'en' => 'name_en' }
      str = described_class.from_json!(obj.to_json)

      expect(str.es).to eq('name_es')
    end
  end
end
