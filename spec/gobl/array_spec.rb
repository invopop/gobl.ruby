# frozen_string_literal: true

require_relative '../../lib/gobl'

RSpec.describe 'Generated Array' do
  let(:array_class) { GOBL::Bill::Discounts }

  it 'instantiates from an array' do
    array = array_class.new([GOBL::Bill::Discount.new])
    expect(array.length).to eq(1)
    expect(array.first).to be_a(GOBL::Bill::Discount)
  end
end
