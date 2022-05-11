# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    # Tax defines a summary of the taxes which may be applied to an invoice.
    class Tax < Dry::Struct
      # Category of the tax already included in the line item prices, especially useful for B2C retailers with customers who prefer final prices inclusive of tax.
      attribute :prices_include, GOBL::Types::String.optional

      # Special tax schemes that apply to this invoice according to local requirements.
      attribute :schemes, SchemeKeys.optional

      # Any additional data that may be required for processing, but should never be relied upon by recipients.
      attribute :meta, GOBL::Org::Meta.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          prices_include: data['prices_include'],
          schemes: data['schemes'] ? SchemeKeys.from_gobl!(data['schemes']) : nil,
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'prices_include' => attributes[:prices_include],
          'schemes' => attributes[:schemes]&.to_gobl,
          'meta' => attributes[:meta]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

