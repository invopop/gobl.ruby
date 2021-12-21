# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class Email < Model::Struct
      attribute :uuid, Model::Types::String.optional

      # Identifier for the email.
      attribute :label, Model::Types::String.optional

      # Electronic mailing address.
      attribute :addr, Model::Types::String

      # Additional fields.
      attribute :meta, Model::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
          label: gobl['label'],
          addr: gobl['addr'],
          meta: gobl['meta']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid],
          'label' => attributes[:label],
          'addr' => attributes[:addr],
          'meta' => attributes[:meta]
        }
      end
    end
  end
end
