# frozen_string_literal: true

require_relative '../../lib/gobl'

RSpec.describe GOBL::Header do
  it 'creates a new header from a JSON' do
    gobl = File.read('spec/example/basic_header.json')
    header = described_class.from_json!(gobl)

    expect(header.meta.value['meta_tag_a']).to eq('a')
    # expect(header.meta['meta_tag_a']).to eq('a') # TODO!
  end
end
