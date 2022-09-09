# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Registration is used in countries that require additional information to be associated with a company usually related to a specific registration office.
    class Registration < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/org/registration'

      # @!attribute [r] uuid
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] office
      # @return [String]
      attribute? :office, GOBL::Types::String.optional

      # @!attribute [r] book
      # @return [String]
      attribute? :book, GOBL::Types::String.optional

      # @!attribute [r] volume
      # @return [String]
      attribute? :volume, GOBL::Types::String.optional

      # @!attribute [r] sheet
      # @return [String]
      attribute? :sheet, GOBL::Types::String.optional

      # @!attribute [r] section
      # @return [String]
      attribute? :section, GOBL::Types::String.optional

      # @!attribute [r] page
      # @return [String]
      attribute? :page, GOBL::Types::String.optional

      # @!attribute [r] entry
      # @return [String]
      attribute? :entry, GOBL::Types::String.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          office: data['office'],
          book: data['book'],
          volume: data['volume'],
          sheet: data['sheet'],
          section: data['section'],
          page: data['page'],
          entry: data['entry']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'office' => attributes[:office],
          'book' => attributes[:book],
          'volume' => attributes[:volume],
          'sheet' => attributes[:sheet],
          'section' => attributes[:section],
          'page' => attributes[:page],
          'entry' => attributes[:entry]
        }.compact
      end
    end
  end
end

