# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class Tax < Dry::Struct
      # Category of the tax already included in the line item prices, especially useful for B2C retailers with customers who prefer final prices inclusive of tax.
      attribute :prices_include, GOBL::Types::String.optional

      # Special tax schemes that apply to this invoice according to local requirements.
      attribute :schemes, GOBL::Types::Array(GOBL::Types::String).optional

      # Any additional data that may be required for processing, but should never be relied upon by recipients.
      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          prices_include: data['prices_include'],
          schemes: data['schemes']&.map { |item| item },
          meta: data['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'prices_include' => attributes[:prices_include],
          'schemes' => attributes[:schemes]&.map { |item| item },
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
