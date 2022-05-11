# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Tax
    # Rate defines a single rate inside a category
    class Rate < Dry::Struct
      # Key identifies this rate within the system
      attribute :key, GOBL::Types::String

      attribute :name, GOBL::I18n::String

      attribute :desc, GOBL::I18n::String.optional

      # Values contains a list of Value objects that contain the current and historical percentage values for the rate; order is important, newer values should come before older values.
      attribute :values, GOBL::Types::Array.of(RateValue)

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          key: data['key'],
          name: GOBL::I18n::String.from_gobl!(data['name']),
          desc: data['desc'] ? GOBL::I18n::String.from_gobl!(data['desc']) : nil,
          values: data['values']&.map { |item| RateValue.from_gobl!(item) }
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'key' => attributes[:key],
          'name' => attributes[:name]&.to_gobl,
          'desc' => attributes[:desc]&.to_gobl,
          'values' => attributes[:values]&.map { |item| item&.to_gobl }
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

