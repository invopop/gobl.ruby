# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe 'Generated Single Value' do
  describe 'String Value' do
    let(:string_value_class) { GOBL::Org::Code }

    it 'instantiates from JSON' do
      value = string_value_class.from_json!('CODE001'.to_json)
      expect(value.to_gobl).to eq('CODE001')
    end

    it 'instantiates from a string' do
      value = string_value_class.new('CODE0001')
      expect(value.to_gobl).to eq('CODE0001')
    end

    it 'instantiates from a symbol' do
      value = string_value_class.new(:code0001)
      expect(value.to_gobl).to eq('code0001')
    end

    it 'instantiates from any object that responds to :to_s' do
      value = string_value_class.new(double(to_s: 'CODE0001'))
      expect(value.to_gobl).to eq('CODE0001')
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
  end

  describe 'Enum String' do
    let(:enum_value_class) { GOBL::Bill::InvoiceType }

    it 'instantiates from JSON' do
      value = enum_value_class.from_json!('credit-note'.to_json)
      expect(value.to_gobl).to eq('credit-note')
    end

    it 'instantiates from a string' do
      value = enum_value_class.new('credit-note')
      expect(value.to_gobl).to eq('credit-note')
    end

    it 'doesn’t instantiate with an unenumerated value' do
      expect { enum_value_class.new('another-value') }.to raise_error(TypeError)
    end

    it 'instantiates from a symbol' do
      value = enum_value_class.new(:credit_note)
      expect(value.to_gobl).to eq('credit-note')
    end

    it 'doesn’t instantiate from an unenumerated symbol' do
      expect { enum_value_class.new(:another_value) }.to raise_error(TypeError)
      expect { enum_value_class.new(:CREDIT_NOTE) }.to raise_error(TypeError)
    end

    it 'returns its description' do
      value = enum_value_class.new('credit-note')

      expect(value.description).to eq('Credit note')
      expect(enum_value_class::ENUM['credit-note']).to eq('Credit note')
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

      expect(value.credit_note?).to eq(true)
      expect(value.corrected?).to eq(false)

      expect(value).to respond_to(:credit_note?)
      expect(value).to respond_to(:corrected?)
      expect(value).not_to respond_to(:another?)
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
      expect(value).not_to respond_to(:pts?)
    end

    it 'instantiates from an unenumerated symbol' do
      value = enum_value_class.new(:value123)
      expect(value.to_gobl).to eq('value123')
    end

    it 'compares with a symbol' do
      value = enum_value_class.new('abc-123 a')
      expect(value).to eq(:abc_123_a)
    end
  end

  describe 'Enum With Empty Option' do
    let(:enum_value_class) { GOBL::Pay::TermKey }

    it 'instantiates from an empty string' do
      value = enum_value_class.from_gobl!('')

      expect(value.to_gobl).to eq('')
      expect(value.description).to eq('Not yet defined')
    end

    it 'instantiates from an empty symbol' do
      value = enum_value_class.new(:'')
      expect(value.to_gobl).to eq('')
    end
  end
end
