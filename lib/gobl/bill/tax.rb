# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Bill
    # Tax defines a summary of the taxes which may be applied to an invoice.
    class Tax < GOBL::Struct
      # The Schema ID of the GOBL Tax structure
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

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Tax] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          prices_include: data['prices_include'] ? GOBL::Org::Code.from_gobl!(data['prices_include']) : nil,
          schemes: data['schemes'] ? SchemeKeys.from_gobl!(data['schemes']) : nil,
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'prices_include' => attributes[:prices_include]&.to_gobl,
          'schemes' => attributes[:schemes]&.to_gobl,
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Tax} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Tax] the object corresponding to the given input
    end
  end
end

