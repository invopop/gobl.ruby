# frozen_string_literal: true

require_relative '../../../lib/gobl'

RSpec.describe GOBL::L10n::CountryCode do
  it 'creates a new country code from a JSON' do
    obj = 'ES'
    code = described_class.from_json!(obj.to_json)

    expect(code.to_s).to eq('ES')
  end

  it 'returns the description of the country' do
    obj = 'ES'
    code = described_class.from_json!(obj.to_json)

    expect(code.description).to eq('Spain')
    expect(described_class::ENUM['ES']).to eq('Spain')
  end

  it 'doesn’t allow to create a country code with an invalid value' do
    obj = 'PP'
    expect { described_class.from_json!(obj.to_json) }.to raise_error(TypeError)
  end

  it 'can be instantiated from a string' do
    code = described_class.new('ES')

    expect(code.to_s).to eq('ES')
  end

  it 'can be instantiated from a symbol' do
    code = described_class.new(:es)

    expect(code.to_s).to eq('ES')
  end

  it 'be compared with a string' do
    code = described_class.from_json!('ES'.to_json)

    expect(code).to eq('ES')
  end

  it 'be compared with a symbol' do
    code = described_class.from_json!('ES'.to_json)

    expect(code).to eq(:es)
  end
end
