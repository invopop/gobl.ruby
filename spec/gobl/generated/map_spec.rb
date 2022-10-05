# frozen_string_literal: true

require './lib/gobl'

RSpec.describe 'Generated Map' do
  let(:map_class) { GOBL::Org::Meta }

  it 'provides access to map values' do
    map = map_class.new({ 'key1' => 'value1' })
    expect(map['key1']).to eq('value1')
  end
end
