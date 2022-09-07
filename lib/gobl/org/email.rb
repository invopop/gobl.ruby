# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Email describes the electronic mailing details.
    class Email < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/org/email'

      # Unique identity code
      attribute? :uuid, GOBL::UUID::UUID.optional

      # Identifier for the email.
      attribute? :label, GOBL::Types::String.optional

      # Electronic mailing address.
      attribute :addr, GOBL::Types::String

      # Additional fields.
      attribute? :meta, GOBL::Org::Meta.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          label: data['label'],
          addr: data['addr'],
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'label' => attributes[:label],
          'addr' => attributes[:addr],
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end
    end
  end
end

