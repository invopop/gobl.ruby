# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Tax
    class Total < Dry::Struct
      # Grouping of all the taxes by their category
      attribute :categories, GOBL::Types::Array(GOBL::Tax::CategoryTotal).optional

      # Total value of all the taxes applied.
      attribute :sum, GOBL::Num::Amount

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          categories: gobl['categories']&.map { |x| GOBL::Tax::CategoryTotal.from_gobl!(x) },
          sum: GOBL::Num::Amount.from_gobl!(gobl['sum'])
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'categories' => attributes[:categories]&.map { |x| x&.to_gobl },
          'sum' => attributes[:sum]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
