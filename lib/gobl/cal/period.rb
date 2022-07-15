# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.28.1
##

require 'dry-struct'

module GOBL
  module Cal
    # Period represents two dates with a start and finish.
    class Period < Dry::Struct
      attribute :start, GOBL::Cal::Date

      attribute :end, GOBL::Cal::Date

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          start: GOBL::Cal::Date.from_gobl!(data['start']),
          end: GOBL::Cal::Date.from_gobl!(data['end'])
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

