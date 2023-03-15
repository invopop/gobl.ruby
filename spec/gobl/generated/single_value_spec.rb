# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe 'Generated Single Value' do
  describe 'String Value' do
    let(:string_value_class) { GOBL::CBC::Code }

    it 'instantiates from JSON' do
      value = string_value_class.from_json!('CODE001'.to_json)
      expect(value.to_s).to eq('CODE001')
    end

    it 'instantiates from a string' do
      value = string_value_class.new('CODE0001')
      expect(value.to_s).to eq('CODE0001')
    end

    it 'instantiates from a symbol' do
      value = string_value_class.new(:code0001)
      expect(value.to_s).to eq('code0001')
    end

    it 'instantiates from any object that responds to :to_s' do
      value = string_value_class.new(double(to_s: 'CODE0001'))
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

    it 'compares with symbols' do
      value = string_value_class.new('CODE-0001 a')

      expect(value).to eq(:code_0001_a)
      expect(value).not_to eq(:code_0001_b)
    end

    describe 'eql?' do
      it 'implements equality without coercion' do
        value = string_value_class.new('CODE0001')

        expect(value).not_to be_eql('CODE0001')
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
    let(:enum_value_class) { GOBL::Bill::Invoice::TypeEnum }

    it 'instantiates from JSON' do
      value = enum_value_class.from_json!('credit-note'.to_json)
      expect(value.to_s).to eq('credit-note')
    end

    it 'instantiates from a string' do
      value = enum_value_class.new('credit-note')
      expect(value.to_s).to eq('credit-note')
    end

    it 'instantiates from a symbol' do
      value = enum_value_class.new(:credit_note)
      expect(value.to_s).to eq('credit-note')
    end

    it 'is valid if the value is within the allowed ones' do
      value = enum_value_class.new('credit-note')
      expect(value).to be_valid
    end

    it 'isn’t valid if the value isn’t within the allowed ones' do
      value = enum_value_class.new('another-value')
      expect(value).not_to be_valid
      expect(value.errors.full_messages).to include('Value "another-value" is not within the allowed values of the enumeration')
    end

    it 'returns its description' do
      value = enum_value_class.new('credit-note')

      expect(value.description).to eq('Reflects a refund either partial or complete of the preceding document.')
      expect(enum_value_class::ENUM['credit-note']).to eq('Reflects a refund either partial or complete of the preceding document.')
    end

    it 'compares with a string' do
      value = enum_value_class.new('credit-note')

      expect(value).to eq('credit-note')
      expect(value).not_to eq('corrected')
    end

    it 'compares with a symbol' do
      value = enum_value_class.new('credit-note')

      expect(value).to eq(:credit_note)
      expect(value).not_to eq(:corrected)
      expect(value).not_to eq(:CREDIT_NOTE)
    end

    it 'responds to inquiries about its value' do
      value = enum_value_class.new('credit-note')

      expect(value.credit_note?).to be(true)
      expect(value.corrective?).to be(false)

      expect(value).to respond_to(:credit_note?)
      expect(value).to respond_to(:corrective?)
      expect(value).not_to respond_to(:another?)
    end
  end

  describe 'Flexible Enum' do
    let(:enum_value_class) { GOBL::Org::Unit }

    it 'instantiates with an invalid value' do
      value = enum_value_class.new('pts')

      expect(value.to_s).to eq('pts')
      expect(value.description).to eq('pts')
    end

    it 'is valid even if the value is not within the allowed ones' do
      value = enum_value_class.new('pts')
      expect(value).to be_valid
    end

    it 'reponds to inquiries about enumerated values' do
      value = enum_value_class.new('day')

      expect(value.day?).to be(true)
      expect(value.min?).to be(false)

      expect(value).to respond_to(:day?)
      expect(value).to respond_to(:min?)
      expect(value).not_to respond_to(:pts?)
    end

    it 'instantiates from an unenumerated symbol' do
      value = enum_value_class.new(:value123)
      expect(value.to_s).to eq('value123')
    end

    it 'compares with a symbol' do
      value = enum_value_class.new('abc-123 a')
      expect(value).to eq(:abc_123_a)
    end
  end

  describe 'Enum With Empty Option' do
    let(:enum_value_class) { GOBL::Pay::Terms::KeyEnum }

    it 'instantiates from an empty string' do
      value = enum_value_class.new('')

      expect(value.to_s).to eq('')
      expect(value.description).to eq('Not yet defined')
    end

    it 'instantiates from an empty symbol' do
      value = enum_value_class.new(:'')
      expect(value.to_s).to eq('')
    end
  end
end
