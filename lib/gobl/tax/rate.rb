# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Tax
    class Rate < Model::Struct
      # From the available options for the region.
      attribute :cat, Model::Types::String

      # As defined for the region and category.
      attribute :code, Model::Types::String

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          cat: gobl['cat'],
          code: gobl['code']
        )
      end

      def to_gobl
        {
          'cat' => attributes[:cat],
          'code' => attributes[:code]
        }
      end
    end
  end
end
