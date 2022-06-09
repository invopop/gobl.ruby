# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe GOBL::Num::Percentage do
  it 'parses amounts' do
    a = described_class.new('10.25%')
    expect(a.value).to be(1025)
    expect(a.exp).to be(4)
    expect(a.to_s).to eql('10.25%')
  end

  it 'compares ok' do
    a = described_class.new('10.25%')
    b = described_class.new('10.250%')
    expect(a == b).to be_truthy
  end

  it 'compares mismatch' do
    a = described_class.new('10.25%')
    b = described_class.new('10.2%')
    expect(a == b).to be_falsy
  end

  it 'provides % of' do
    a = described_class.new('10%')
    b = GOBL::Num::Amount.new('100.00')

    x = a.of(b)
    expect(x.to_s).to eql('10.00')
  end

  it 'provides % from' do
    a = described_class.new('10%')
    b = GOBL::Num::Amount.new('100.00')

    x = a.from(b)
    expect(x.to_s).to eql('9.09')
  end

  it 'provides factor' do
    a = described_class.new('10%')
    x = a.factor
    expect(x.to_s).to eql('1.10')
  end
end
