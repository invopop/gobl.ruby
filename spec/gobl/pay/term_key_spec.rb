# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe GOBL::Pay::TermKey do
  it 'creates a new term key from an empty value' do
    obj = ''
    unit = described_class.from_json!(obj.to_json)

    expect(unit.to_s).to eq('')
    expect(unit.description).to eq('Not yet defined')
  end

  it 'doesn’t allow to create a term key with an invalid value' do
    obj = 'wadus'
    expect { described_class.from_json!(obj.to_json) }.to raise_error(TypeError)
  end
end
