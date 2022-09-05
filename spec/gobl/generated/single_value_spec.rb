# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe 'Generated Single Value' do
  describe 'Enum String' do
    let(:enum_value_class) { GOBL::L10n::CountryCode }

    it 'instantiates from JSON' do
      value = enum_value_class.from_json!('ES'.to_json)
      expect(value.to_gobl).to eq('ES')
    end

    it 'doesn’t instantiate with an invalid value' do
      expect { enum_value_class.from_gobl!('PP') }.to raise_error(TypeError)
    end

    it 'returns the description of the country' do
      value = enum_value_class.from_gobl!('ES')

      expect(value.description).to eq('Spain')
      expect(enum_value_class::ENUM['ES']).to eq('Spain')
    end
  end

  describe 'Flexible Enum' do
    let(:enum_value_class) { GOBL::Org::Unit }

    it 'instantiates with an invalid value' do
      value = enum_value_class.from_gobl!('pts')

      expect(value.to_gobl).to eq('pts')
      expect(value.description).to eq('pts')
    end

    it 'reponds to inquiries about enumerated values' do
      value = enum_value_class.from_gobl!('day')

      expect(value.day?).to eq(true)
      expect(value.min?).to eq(false)

      expect(value).to respond_to(:day?)
      expect(value).to respond_to(:min?)
      expect(value).to_not respond_to(:pts?)
    end
  end

  describe 'Enum With Empty Option' do
    let(:enum_value_class) { GOBL::Pay::TermKey }

    it 'instantiates from an empty string' do
      value = enum_value_class.from_gobl!('')

      expect(value.to_gobl).to eq('')
      expect(value.description).to eq('Not yet defined')
    end
  end
end
