# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.29.0
##

require 'dry-struct'

module GOBL
  module Org
    # SourceKey identifies the source of a tax identity
    class SourceKey < Dry::Struct
      ENUM = {
        'tax-agency' => 'Sourced directly from a tax agency',
        'passport' => 'A passport document',
        'national' => 'National ID Card or similar',
        'permit' => 'Residential or similar permit',
        'other' => 'An other type of source not listed'
      }

      attribute :_value, GOBL::Types::Any.enum(*ENUM.keys)

      def self.from_gobl!(data)
        new(_value: data)
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        _value
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end

      def to_s
        _value.to_s
      end

      def description
        ENUM.fetch(_value, _value)
      end

      INQUIRERS = ENUM.keys.map { |key| [ "#{key.underscore}?".to_sym, key ] }.to_h

      def respond_to_missing?(method_name, include_private = false)
        INQUIRERS.has_key?(method_name) || super
      end

      def method_missing(method_name, *args, &block)
        if INQUIRERS.has_key?(method_name)
          _value == INQUIRERS[method_name]
        else
          super
        end
      end
    end
  end
end

