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
      attribute :notes, (Model::Types::Hash | Model::Types::Nil).optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          code: gobl['code'],
          notes: gobl['notes']
        )
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'notes' => attributes[:notes]
        }
      end
    end
  end
end
