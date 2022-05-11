# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Org
    # TaxIdentity stores the details required to identify an entity for tax purposes.
    class TaxIdentity < Dry::Struct
      # Unique universal identity code.
      attribute :uuid, GOBL::UUID::UUID.optional

      # ISO country code for Where the tax identity was issued.
      attribute :country, GOBL::Types::String

      # Where inside a country the Tax ID was issued, if required.
      attribute :locality, GOBL::Types::String.optional

      # What is the source document of this tax identity.
      attribute :document, GOBL::Types::String.optional

      # Tax identity Code
      attribute :code, GOBL::Types::String.optional

      # Additional details that may be required.
      attribute :meta, GOBL::Org::Meta.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          country: data['country'],
          locality: data['locality'],
          document: data['document'],
          code: data['code'],
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'country' => attributes[:country],
          'locality' => attributes[:locality],
          'document' => attributes[:document],
          'code' => attributes[:code],
          'meta' => attributes[:meta]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

