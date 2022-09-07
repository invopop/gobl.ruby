# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Cal
    # Period represents two dates with a start and finish.
    class Period < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/cal/period'

      attribute :start, GOBL::Cal::Date

      attribute :end, GOBL::Cal::Date

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          start: GOBL::Cal::Date.from_gobl!(data['start']),
          end: GOBL::Cal::Date.from_gobl!(data['end'])
        )
      end

      def to_gobl
        {
          'start' => attributes[:start]&.to_gobl,
          'end' => attributes[:end]&.to_gobl
        }.compact
      end
    end
  end
end

