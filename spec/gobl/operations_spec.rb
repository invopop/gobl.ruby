# frozen_string_literal: true

require_relative '../../lib/gobl'

RSpec.describe GOBL::Operations do
  include TestServer

  before(:all) do
    host, port = start_test_server

    GOBL.config.service_host = host
    GOBL.config.service_port = port
  end

  after(:all) { stop_test_server }

  describe '#build' do
    it 'builds a document' do
      gobl = File.read('spec/example/uncalculated_invoice.json')
      doc = GOBL::Schema::Object.from_json!(gobl)

      built_doc = GOBL.build(doc)

      invoice = built_doc.extract

      expect(invoice.totals).to be_present
      expect(invoice.totals.total).to eq(GOBL::Num::Amount.new('1800.00'))
    end

    it 'builds a document and envelops it' do
      gobl = File.read('spec/example/uncalculated_invoice.json')
      doc = GOBL::Schema::Object.from_json!(gobl)

      envelope = GOBL.build(doc, envelop: true)

      expect(envelope).not_to be_signed

      invoice = envelope.extract
      expect(invoice.totals).to be_present
    end

    it 'fails when an invalid document is given' do
      invalid_docs = [
        GOBL::Schema::Object.new({}),
        GOBL::Schema::Object.new('$schema' => 'https://gobl.org/draft-0/bill/invoice')
      ]

      invalid_docs.each do |struct|
        expect { GOBL.build(struct) }.to raise_error(GOBL::Operations::ServiceError)
      end
    end

    it 'fails when an unsupported struct is given' do
      gobl = File.read('spec/example/basic_header.json')
      header = GOBL::Head::Header.from_json!(gobl)

      expect { GOBL.build(header) }.to raise_error(ArgumentError)
    end
  end

  describe '#validate' do
    it 'validates an invalid document' do
      gobl = File.read('spec/example/uncalculated_invoice.json')
      doc = GOBL::Schema::Object.from_json!(gobl)

      result = GOBL.validate(doc)

      expect(result).not_to be_valid
      expect(result.errors).to include('totals: cannot be blank')
    end

    it 'validates a valid envelope' do
      gobl = File.read('spec/example/message_envelope.json')
      doc = GOBL::Envelope.from_json!(gobl)

      result = GOBL.validate(doc)

      expect(result).to be_valid
      expect(result.errors).to be_blank
    end

    it 'validates invalid documents' do
      invalid_docs = [
        GOBL::Schema::Object.new({}),
        GOBL::Schema::Object.new('$schema' => 'https://gobl.org/draft-0/bill/invoice')
      ]

      invalid_docs.each do |struct|
        result = GOBL.validate(struct)
        expect(result).not_to be_valid
      end
    end

    it 'fails when an unsupported struct is given' do
      gobl = File.read('spec/example/basic_header.json')
      header = GOBL::Head::Header.from_json!(gobl)

      expect { GOBL.validate(header) }.to raise_error(ArgumentError)
    end
  end

  describe '#sign' do
    it 'signs a draft envelope' do
      gobl = File.read('spec/example/draft_envelope.json')
      envelope = GOBL::Envelope.from_json!(gobl)

      signed_envelope = GOBL.sign(envelope)

      expect(signed_envelope.sigs).not_to be_empty
    end

    it 'signs a document' do
      gobl = File.read('spec/example/uncalculated_invoice.json')
      doc = GOBL::Schema::Object.from_json!(gobl)

      envelope = GOBL.sign(doc)

      expect(envelope.sigs).not_to be_empty

      invoice = envelope.extract
      expect(invoice.totals).to be_present
    end

    it 'fails when an invalid document is given' do
      invalid_docs = [
        GOBL::Schema::Object.new({}),
        GOBL::Schema::Object.new('$schema' => 'https://gobl.org/draft-0/bill/invoice')
      ]

      invalid_docs.each do |struct|
        expect { GOBL.sign(struct) }.to raise_error(GOBL::Operations::ServiceError)
      end
    end

    it 'fails when an unsupported struct is given' do
      gobl = File.read('spec/example/basic_header.json')
      header = GOBL::Head::Header.from_json!(gobl)

      expect { GOBL.sign(header) }.to raise_error(ArgumentError)
    end
  end
end
