# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe 'Generated Single Value' do
  describe 'String Value' do
    let(:string_value_class) { GOBL::CBC::Code }

    it 'instantiates from a string' do
      value = string_value_class.new('CODE0001')
      expect(value.to_s).to eq('CODE0001')
    end

    it 'compares with other objects of the same class' do
      value1 = string_value_class.new('CODE0001')
      value2 = string_value_class.new('CODE0001')
      value3 = string_value_class.new('CODE0002')

      expect(value1).to eq(value2)
      expect(value1).not_to eq(value3)
    end

    it 'compares with strings' do
      value = string_value_class.new('CODE0001')

      expect(value).to eq('CODE0001')
      expect(value).not_to eq('CODE0002')
    end

    describe 'eql?' do
      it 'implements equality without coercion' do
        value = string_value_class.new('CODE0001')

        expect(value).to be_eql('CODE0001')
        expect(value).not_to be_eql(:code0001)
        expect(value).not_to be_eql(string_value_class.new('CODE0002'))

        expect(value).to be_eql(string_value_class.new('CODE0001'))
      end
    end

    describe 'hash' do
      it 'returns the same hash for two objects when eql? would be true' do
        value = string_value_class.new('CODE0001')

        expect(value.hash).to eq(string_value_class.new('CODE0001').hash)
      end
    end
  end

  describe 'Enum String' do
    let(:enum_value_class) { GOBL::L10n::CountryCode }

    it 'instantiates from a string' do
      value = enum_value_class.new('AF')
      expect(value).to eq('AF')
    end

    it 'is valid if the value is within the allowed ones' do
      value = enum_value_class.new('AF')
      expect(value).to be_valid
    end

    it 'isn’t valid if the value isn’t within the allowed ones' do
      value = enum_value_class.new('XX')
      expect(value).not_to be_valid
      expect(value.errors.full_messages).to include('Value "XX" is not within the allowed values of the enumeration')
    end

    it 'returns the description of the value' do
      value = enum_value_class.new('AF')
      expect(value.description).to eq('Afghanistan')
    end
  end

  describe 'Flexible Enum' do
    let(:enum_value_class) { GOBL::Org::Unit }

    it 'instantiates with an known value' do
      value = enum_value_class.new('kg')
      expect(value).to eq('kg')
    end

    it 'instantiates with an unknown value' do
      value = enum_value_class.new('pts')
      expect(value).to eq('pts')
    end

    it 'is valid even with unknown values' do
      value = enum_value_class.new('pts')
      expect(value).to be_valid
    end

    it 'returns the description of an known value' do
      value = enum_value_class.new('kg')
      expect(value.description).to eq('Metric kilograms')
    end

    it 'returns the description of an unknown value' do
      value = enum_value_class.new('pts')
      expect(value.description).to eq('pts')
    end
  end
end
