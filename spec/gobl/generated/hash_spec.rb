# frozen_string_literal: true

require './lib/gobl'

RSpec.describe 'Generated Hash' do
  let(:hash_class) { GOBL::Org::Meta }

  it 'provides access to hash values' do
    hash = hash_class.from_gobl!({ 'key1' => 'value1' })
    expect(hash['key1']).to eq('value1')
  end
end
