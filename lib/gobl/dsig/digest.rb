# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Dsig
    class Digest < Model::Struct
      attribute :alg, Model::Types::String

      attribute :val, Model::Types::String

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          alg: gobl['alg'],
          val: gobl['val']
        )
      end

      def to_gobl
        {
          'alg' => attributes[:alg],
          'val' => attributes[:val]
        }
      end
    end
  end
end
