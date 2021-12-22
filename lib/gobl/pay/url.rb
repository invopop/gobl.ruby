# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Pay
    class URL < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional

      # Full URL to be used for payment.
      attribute :addr, Model::Types::String

      # Additional details which may be useful to the end-user.
      attribute :notes, Model::Types::String.optional

      # Semi-structured additional data.
      attribute :meta, Model::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'] ? GOBL::UUID::UUID.from_gobl!(gobl['uuid']) : nil,
          addr: gobl['addr'],
          notes: gobl['notes'],
          meta: gobl['meta']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'addr' => attributes[:addr],
          'notes' => attributes[:notes],
          'meta' => attributes[:meta]
        }
      end
    end
  end
end
