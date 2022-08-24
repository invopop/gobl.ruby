# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Cal
    # Civil date in simplified ISO format, like 2021-05-26
    class Date < GOBL::Struct
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

