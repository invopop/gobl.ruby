# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # Tax defines a summary of the taxes which may be applied to an invoice.
    class Tax < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Tax'

      # @!attribute [r] prices_include
      # Category of the tax already included in the line item prices, especially useful for B2C retailers with customers who prefer final prices inclusive of tax.
      # @return [GOBL::Org::Code]
      attribute? :prices_include, GOBL::Org::Code.optional

      # @!attribute [r] schemes
      # Special tax schemes that apply to this invoice according to local requirements.
      # @return [SchemeKeys]
      attribute? :schemes, SchemeKeys.optional

      # @!attribute [r] meta
      # Any additional data that may be required for processing, but should never be relied upon by recipients.
      # @return [GOBL::Org::Meta]
      attribute? :meta, GOBL::Org::Meta.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          prices_include: data['prices_include'] ? GOBL::Org::Code.from_gobl!(data['prices_include']) : nil,
          schemes: data['schemes'] ? SchemeKeys.from_gobl!(data['schemes']) : nil,
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      def to_gobl
        {
          'prices_include' => attributes[:prices_include]&.to_gobl,
          'schemes' => attributes[:schemes]&.to_gobl,
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end
    end
  end
end

