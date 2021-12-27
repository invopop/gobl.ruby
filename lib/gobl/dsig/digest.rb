# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Dsig
    class Digest < Dry::Struct
      attribute :alg, GOBL::Types::String

      attribute :val, GOBL::Types::String

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          alg: gobl['alg'],
          val: gobl['val']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'alg' => attributes[:alg],
          'val' => attributes[:val]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
