# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Tax
    class Total < Model::Struct
      attribute :categories, Model::Types::Array(GOBL::Tax::CategoryTotal).optional

      # Total value of all the taxes to be added or retained.
      attribute :sum, Model::Types::String

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          categories: gobl['categories']&.map { |x| GOBL::Tax::CategoryTotal.from_gobl!(x) },
          sum: gobl['sum']
        )
      end

      def to_gobl
        {
          'categories' => attributes[:categories]&.map { |x| x&.to_gobl },
          'sum' => attributes[:sum]
        }
      end
    end
  end
end
