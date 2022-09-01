# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # TaxIdentity stores the details required to identify an entity for tax purposes.
    class TaxIdentity < GOBL::Struct
      # Unique universal identity code.
      attribute :uuid, GOBL::UUID::UUID.optional

      # ISO country code for Where the tax identity was issued.
      attribute :country, GOBL::L10n::CountryCode

      # Where inside a country the Tax ID was issued, if required.
      attribute :locality, GOBL::L10n::Code.optional

      # What is the source document of this tax identity.
      attribute :source, SourceKey.optional

      # Tax identity Code
      attribute :code, GOBL::Types::String.optional

      # Additional details that may be required.
      attribute :meta, GOBL::Org::Meta.optional

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
    end
  end
end

