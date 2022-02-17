# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Org
    class Period < Dry::Struct
      attribute :start, GOBL::Org::Date

      attribute :end, GOBL::Org::Date

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          start: GOBL::Org::Date.from_gobl!(data['start']),
          end: GOBL::Org::Date.from_gobl!(data['end'])
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'start' => attributes[:start]&.to_gobl,
          'end' => attributes[:end]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
