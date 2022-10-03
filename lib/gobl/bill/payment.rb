# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Bill
    # Payment contains details as to how the invoice should be paid.
    class Payment < GOBL::Struct
      # The Schema ID of the GOBL Payment structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Payment'

      # @!attribute [r] payer
      # The party responsible for paying for the invoice, if not the customer.
      # @return [GOBL::Org::Party]
      attribute? :payer, GOBL::Org::Party.optional

      # @!attribute [r] terms
      # Payment terms or conditions.
      # @return [GOBL::Pay::Terms]
      attribute? :terms, GOBL::Pay::Terms.optional

      # @!attribute [r] advances
      # Any amounts that have been paid in advance and should be deducted from the amount due.
      # @return [Advances]
      attribute? :advances, Advances.optional

      # @!attribute [r] instructions
      # Details on how payment should be made.
      # @return [GOBL::Pay::Instructions]
      attribute? :instructions, GOBL::Pay::Instructions.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Payment] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          payer: data['payer'] ? GOBL::Org::Party.from_gobl!(data['payer']) : nil,
          terms: data['terms'] ? GOBL::Pay::Terms.from_gobl!(data['terms']) : nil,
          advances: data['advances'] ? Advances.from_gobl!(data['advances']) : nil,
          instructions: data['instructions'] ? GOBL::Pay::Instructions.from_gobl!(data['instructions']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'payer' => attributes[:payer]&.to_gobl,
          'terms' => attributes[:terms]&.to_gobl,
          'advances' => attributes[:advances]&.to_gobl,
          'instructions' => attributes[:instructions]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Payment} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   The `new` method will only allow to create a new object if all attributes
      #   marked as mandatory and not calculated in the JSON schema are provided.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Payment] the object corresponding to the given input
    end
  end
end

