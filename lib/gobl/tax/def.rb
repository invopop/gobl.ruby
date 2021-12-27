# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Tax
    class Def < Dry::Struct
      # Code identifies this rate within the system
      attribute :code, GOBL::Types::String

      attribute :name, GOBL::I18n::String

      attribute :desc, GOBL::I18n::String.optional

      # Set of values ordered by date that determine what rates to apply since when.
      attribute :values, GOBL::Types::Array(GOBL::Tax::Value)

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          code: gobl['code'],
          name: GOBL::I18n::String.from_gobl!(gobl['name']),
          desc: gobl['desc'] ? GOBL::I18n::String.from_gobl!(gobl['desc']) : nil,
          values: gobl['values']&.map { |x| GOBL::Tax::Value.from_gobl!(x) }
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'name' => attributes[:name]&.to_gobl,
          'desc' => attributes[:desc]&.to_gobl,
          'values' => attributes[:values]&.map { |x| x&.to_gobl }
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
