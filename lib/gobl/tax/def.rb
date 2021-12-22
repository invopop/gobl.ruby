# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Tax
    class Def < Model::Struct
      attribute :code, Model::Types::String

      attribute :name, (Model::Types::Hash | Model::Types::Nil)

      attribute :desc, (Model::Types::Hash | Model::Types::Nil).optional

      # Set of values ordered by date that determine what rates to apply since when.
      attribute :values, Model::Types::Array(GOBL::Tax::Value)

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          code: gobl['code'],
          name: gobl['name'],
          desc: gobl['desc'],
          values: gobl['values']&.map { |x| GOBL::Tax::Value.from_gobl!(x) }
        )
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'name' => attributes[:name],
          'desc' => attributes[:desc],
          'values' => attributes[:values]&.map { |x| x&.to_gobl }
        }
      end
    end
  end
end
