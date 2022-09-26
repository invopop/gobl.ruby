# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Tax
    # Locality represents an area inside a region, like a province or a state, which shares the basic definitions of the region, but may vary in some validation rules.
    class Locality < GOBL::Struct
      # The Schema ID of the GOBL Locality structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/region#/$defs/Locality'

      # @!attribute [r] code
      # Code
      # @return [GOBL::L10n::Code]
      attribute :code, GOBL::L10n::Code

      # @!attribute [r] name
      # Name of the locality with local and hopefully international translations.
      # @return [GOBL::I18n::String]
      attribute :name, GOBL::I18n::String

      # @!attribute [r] meta
      # Any additional information
      # @return [GOBL::Org::Meta]
      attribute? :meta, GOBL::Org::Meta.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Locality] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          code: GOBL::L10n::Code.from_gobl!(data['code']),
          name: GOBL::I18n::String.from_gobl!(data['name']),
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'code' => attributes[:code]&.to_gobl,
          'name' => attributes[:name]&.to_gobl,
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Locality} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Locality] the object corresponding to the given input
    end
  end
end

