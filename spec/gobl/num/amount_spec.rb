# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe GOBL::Num::Amount do
  it 'parses amounts' do
    a = described_class.new('10.25')
    expect(a.value).to eq(1025)
    expect(a.exp).to eq(2)

    a = described_class.new('1123')
    expect(a.value).to eq(1123)
    expect(a.exp).to eq(0)

    a = described_class.new('1123.0001')
    expect(a.value).to eq(11_230_001)
    expect(a.exp).to eq(4)
    expect(a.to_s).to eql('1123.0001')
  end

  it 'rescales' do
    a = described_class.new('1123.0001')
    b = a.rescale(2)
    expect(b.value).to eq(112_300)
    expect(b.exp).to eq(2)
    expect(b.to_s).to eql('1123.00')
    b = a.rescale(6)
    expect(b.value).to eq(1123000100)
    expect(b.exp).to eq(6)
    expect(b.to_s).to eql('1123.000100')
  end

  it 'compares' do
    a = described_class.new('1123.0000')
    b = described_class.new('1123')
    expect(a == b).to be_truthy

    b = described_class.new('1120')
    expect(a.compare(b)).to eql(1)

    b = described_class.new('1123.000001')
    expect(a.compare(b)).to eql(-1)
  end
end
