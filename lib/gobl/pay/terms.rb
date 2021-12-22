# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Pay
    class Terms < Model::Struct
      # Type of terms to be applied.
      attribute :code, Model::Types::String

      # Description of the conditions for payment.
      attribute :notes, GOBL::I18n::String.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          code: gobl['code'],
          notes: gobl['notes'] ? GOBL::I18n::String.from_gobl!(gobl['notes']) : nil
        )
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'notes' => attributes[:notes]&.to_gobl
        }
      end
    end
  end
end
