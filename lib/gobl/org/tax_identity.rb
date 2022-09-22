# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.3
##


module GOBL
  module Org
    # TaxIdentity stores the details required to identify an entity for tax purposes.
    class TaxIdentity < GOBL::Struct
      # The Schema ID of the GOBL TaxIdentity structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/tax-identity'

      # @!attribute [r] uuid
      # Unique universal identity code.
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] country
      # ISO country code for Where the tax identity was issued.
      # @return [GOBL::L10n::CountryCode]
      attribute :country, GOBL::L10n::CountryCode

      # @!attribute [r] locality
      # Where inside a country the Tax ID was issued, if required.
      # @return [GOBL::L10n::Code]
      attribute? :locality, GOBL::L10n::Code.optional

      # @!attribute [r] source
      # What is the source document of this tax identity.
      # @return [SourceKey]
      attribute? :source, SourceKey.optional

      # @!attribute [r] code
      # Tax identity Code
      # @return [String]
      attribute? :code, GOBL::Types::String.optional

      # @!attribute [r] meta
      # Additional details that may be required.
      # @return [GOBL::Org::Meta]
      attribute? :meta, GOBL::Org::Meta.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [TaxIdentity] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          country: GOBL::L10n::CountryCode.from_gobl!(data['country']),
          locality: data['locality'] ? GOBL::L10n::Code.from_gobl!(data['locality']) : nil,
          source: data['source'] ? SourceKey.from_gobl!(data['source']) : nil,
          code: data['code'],
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'country' => attributes[:country]&.to_gobl,
          'locality' => attributes[:locality]&.to_gobl,
          'source' => attributes[:source]&.to_gobl,
          'code' => attributes[:code],
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {TaxIdentity} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [TaxIdentity] the object corresponding to the given input
    end
  end
end

