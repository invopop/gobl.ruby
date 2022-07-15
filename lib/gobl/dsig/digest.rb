# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.28.1
##

require 'dry-struct'

module GOBL
  module DSig
    # Digest defines a structure to hold a digest value including the algorithm used to generate it.
    class Digest < Dry::Struct
      # Algorithm stores the algorithm key that was used to generate the value.
      attribute :alg, GOBL::Types::String

      # Value contains the Hexadecimal representation of the resulting hash generated by the algorithm.
      attribute :val, GOBL::Types::String

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          alg: data['alg'],
          val: data['val']
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

