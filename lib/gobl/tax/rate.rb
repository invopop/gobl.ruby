# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Tax
    # Rate defines a single rate inside a category
    class Rate < GOBL::Struct
      # Key identifies this rate within the system
      attribute :key, GOBL::Org::Key

      attribute :name, GOBL::I18n::String

      attribute? :desc, GOBL::I18n::String.optional

      # Values contains a list of Value objects that contain the current and historical percentage values for the rate; order is important, newer values should come before older values.
      attribute :values, GOBL::Types::Array.of(RateValue)

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          key: GOBL::Org::Key.from_gobl!(data['key']),
          name: GOBL::I18n::String.from_gobl!(data['name']),
          desc: data['desc'] ? GOBL::I18n::String.from_gobl!(data['desc']) : nil,
          values: data['values']&.map { |item| RateValue.from_gobl!(item) }
        )
      end

      def to_gobl
        {
          'key' => attributes[:key]&.to_gobl,
          'name' => attributes[:name]&.to_gobl,
          'desc' => attributes[:desc]&.to_gobl,
          'values' => attributes[:values]&.map { |item| item&.to_gobl }
        }.compact
      end
    end
  end
end

