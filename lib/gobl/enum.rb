# frozen_string_literal: true

module GOBL
  # Base class for single value structures in the GOBL schema that have a controlled set
  # of values associated to them (i.e., an enumeration) that may constrain them
  module Enum
    def self.included(base)
      base.include ActiveModel::Validations

      base.class_eval do
        validate :valid_enum_value, if: :strict_enum?
      end
    end

    def description
      self.class::ENUM.fetch(self, self)
    end

    def valid_enum_value
      errors.add(:base, "Value \"#{self}\" is not within the allowed values of the enumeration") unless self.class::ENUM.key?(self)
    end
  end
end
