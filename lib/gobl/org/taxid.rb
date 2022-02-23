# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Org
    class TaxID < Dry::Struct
      # Unique universal identity code
      attribute :uuid, GOBL::UUID::UUID.optional

      # ISO country code for Where the tax identity was issued
      attribute :country, GOBL::Types::String

      # Identity Code
      attribute :code, GOBL::Types::String

      # Additional details.
      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          :uuid => data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          :country => data['country'],
          :code => data['code'],
          :meta => data['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'country' => attributes[:country],
          'code' => attributes[:code],
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
