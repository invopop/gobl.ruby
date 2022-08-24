# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module UUID
    # Universally Unique Identifier. We only recommend using versions 1 and 4 within GOBL.
    class UUID < GOBL::Struct
      attribute :_value, GOBL::Types::String

      def self.from_gobl!(data)
        new(_value: data)
      end

      def to_gobl
        _value
      end

      def to_s
        _value.to_s
      end
    end
  end
end

