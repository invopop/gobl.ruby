# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Telephone describes what is expected for a telephone number.
    class Telephone < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/org/telephone'

      # @!attribute [r] uuid
      # Unique identity code
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] label
      # Identifier for this number.
      # @return [String]
      attribute? :label, GOBL::Types::String.optional

      # @!attribute [r] num
      # The number to be dialed in ITU E.164 international format.
      # @return [String]
      attribute :num, GOBL::Types::String

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          label: data['label'],
          num: data['num']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'label' => attributes[:label],
          'num' => attributes[:num]
        }.compact
      end
    end
  end
end

