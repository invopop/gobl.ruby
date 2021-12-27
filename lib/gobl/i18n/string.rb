# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module I18n
    class String < GOBL::Struct
      # Map of 2-Letter language codes to their translations.
      attribute :value, (GOBL::Types::Hash | GOBL::Types::Nil)

      def self.from_gobl!(gobl)
        new(
          value: gobl
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        value
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
