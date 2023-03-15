# frozen_string_literal: true

module GOBL
  # Base class for single value structures in the GOBL schema that have a controlled set
  # of values associated to them (i.e., an enumeration) that may constrain them
  module Enum
    def self.included(base)
      base.include ActiveModel::Validations
      base.extend ClassMethods
      base.class_eval do
        validate :valid_enum_value
      end
    end

    # Returns an enum value object that corresponds to a given value. The value can be a
    # `Symbol`, a `String` or anything coercible into one (via `#to_s`)
    #
    # @param value [Symbol, String, #to_s] the value of the object
    #
    # @return [Enum] the enum value instance corresponding to the given value
    def initialize(value)
      if value.is_a? Symbol
        self._value = value_from_sym(value) || value.to_s
      else
        super
      end
    end

    # Returns the description of the current enum value
    #
    # @return [String] the description of the current enum value
    def description
      self.class::ENUM.fetch(_value, _value)
    end

    # Enables dynamic value inquirers for each of the declared enum values. Each inquirer
    # returns a `Boolean` denoting whether the value equals the enquired value (`true`) or
    # not (`false`)
    def method_missing(method_name, *args, &block)
      if (value = self.class.find_by_inquirer(method_name))
        self == value
      else
        super
      end
    end

    # @api private
    def respond_to_missing?(method_name, include_private = false)
      self.class.find_by_inquirer(method_name) || super
    end

    module ClassMethods
      # Returns an array with all the enumerated objects of this type
      #
      # @return [Array<#{name}>] the array of enumerated objects
      def all
        self::ENUM.keys.map { |key| new(key) }
      end

      # @api private
      def find_by_sym(sym)
        all.find { |object| object.to_sym == sym }
      end

      # @api private
      def find_by_inquirer(method_name)
        method_name =~ /(.+)\?$/ && find_by_sym(Regexp.last_match(1).to_sym)
      end
    end

    private

    def value_from_sym(sym)
      self.class.find_by_sym(sym)&.to_s
    end

    def valid_enum_value
      errors.add(:base, "Value \"#{self}\" is not within the allowed values of the enumeration") if strict_enum? && !self.class.all.include?(self)
    end
  end
end
