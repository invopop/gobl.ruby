# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Pay
    class Terms < GOBL::Struct
      # Type of terms to be applied.
      attribute :code, GOBL::Types::String

      # Description of the conditions for payment.
      attribute :notes, GOBL::I18n::String.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          code: gobl['code'],
          notes: gobl['notes'] ? GOBL::I18n::String.from_gobl!(gobl['notes']) : nil
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'notes' => attributes[:notes]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
