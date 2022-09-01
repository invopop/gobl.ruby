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
      attribute :uuid, GOBL::UUID::UUID.optional

      attribute :office, GOBL::Types::String.optional

      attribute :book, GOBL::Types::String.optional

      attribute :volume, GOBL::Types::String.optional

      attribute :sheet, GOBL::Types::String.optional

      attribute :section, GOBL::Types::String.optional

      attribute :page, GOBL::Types::String.optional

      attribute :entry, GOBL::Types::String.optional

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

