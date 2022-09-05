# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Short upper-case identifier.
    class Code < GOBL::Struct
      attribute :_value, GOBL::Types::String
      private :_value

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

      def ==(other)
        case other
        when self.class
          super
        when Symbol
          to_sym == other
        else
          to_s == other.to_s
        end
      end

      def to_sym
        to_s.parameterize.underscore.to_sym
      end
    end
  end
end

