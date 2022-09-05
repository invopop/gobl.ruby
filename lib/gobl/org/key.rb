# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Text identifier to be used instead of a code for a more verbose but readable identifier.
    class Key < GOBL::Struct
      attribute :_value, GOBL::Types::String

      def self.from_gobl!(data)
        new(_value: data)
      end

      def to_gobl
        _value
      end

      def self.new(object)
        case object
        when Hash, self
          super
        when Symbol
          new object.to_s
        else
          super _value: object.to_s
        end
      end

      def to_s
        _value.to_s
      end

      def to_sym
        to_s.parameterize.underscore.to_sym
      end
    end
  end
end

