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

      def ==(other)
        case other
        when self.class
          super
        when String
          to_s == other
        when Symbol
          to_sym == other
        else
          if other.respond_to?(:to_s)
            self == other.to_s
          else
            super
          end
        end
      end

      def self.new(object)
        case object
        when Hash, self
          super
        when String
        super _value: object


        else
          if object.respond_to?(:to_s)
        super _value: object.to_s
      else
        super
      end

        end
      end

      def to_sym
        to_s.parameterize.underscore.to_sym
      end
    end
  end
end

