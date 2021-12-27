# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Org
    class Registration < Dry::Struct
      attribute :uuid, GOBL::UUID::UUID.optional

      # Office where the company is registered.
      attribute :office, GOBL::Types::String.optional

      attribute :book, GOBL::Types::String.optional

      attribute :volume, GOBL::Types::String.optional

      attribute :sheet, GOBL::Types::String.optional

      attribute :section, GOBL::Types::String.optional

      attribute :page, GOBL::Types::String.optional

      attribute :entry, GOBL::Types::String.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'] ? GOBL::UUID::UUID.from_gobl!(gobl['uuid']) : nil,
          office: gobl['office'],
          book: gobl['book'],
          volume: gobl['volume'],
          sheet: gobl['sheet'],
          section: gobl['section'],
          page: gobl['page'],
          entry: gobl['entry']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
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
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
