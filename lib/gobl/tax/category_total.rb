# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Tax
    class CategoryTotal < Model::Struct
      attribute :code, Model::Types::String

      attribute :retained, Model::Types::Bool.optional

      attribute :rates, Model::Types::Array(GOBL::Tax::RateTotal)

      attribute :base, Model::Types::String

      attribute :value, Model::Types::String

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          code: gobl['code'],
          retained: gobl['retained'],
          rates: gobl['rates'],
          base: gobl['base'],
          value: gobl['value']
        )
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'retained' => attributes[:retained],
          'rates' => attributes[:rates],
          'base' => attributes[:base],
          'value' => attributes[:value]
        }
      end
    end
  end
end
