# frozen_string_literal: true

require_relative '../../lib/gobl'

RSpec.describe 'Single Value Struct' do
  describe 'String Value' do
    let(:string_value_class) { GOBL::Org::Code }

    it 'can be instantiated from a string' do
      code = string_value_class.new('CODE0001')
      expect(code.to_gobl).to eq('CODE0001')
    end

    it 'can be instantiated from a symbol' do
      code = string_value_class.new(:code123)
      expect(code.to_gobl).to eq('code123')
    end

    it 'can be instantiated from any object that responds to :to_s' do
      code = string_value_class.new(double(to_s: 'code333'))
      expect(code.to_gobl).to eq('code333')
    end

    it 'can be compared with other objects of the same class' do
      code1 = string_value_class.new('CODE0001')
      code2 = string_value_class.new('CODE0001')
      code3 = string_value_class.new('CODE0002')

      expect(code1).to eq(code2)
      expect(code1).not_to eq(code3)
    end

    it 'can be compared with strings' do
      code = string_value_class.new('CODE0001')

      expect(code).to eq('CODE0001')
      expect(code).not_to eq('CODE0002')
    end

    it 'can be compared with symbols' do
      code = string_value_class.new('abc-123 a')

      expect(code).to eq(:abc_123_a)
      expect(code).not_to eq(:abc_123_b)
    end
  end
end
