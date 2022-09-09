# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Inbox is used to store data about a connection with a service that is responsible for potentially receiving copies of GOBL envelopes or other document formats defined locally.
    class Inbox < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/org/inbox'

      # @!attribute [r] uuid
      # Unique ID. Useful if inbox is stored in a database.
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] key
      # Type of inbox being defined.
      # @return [GOBL::Org::Key]
      attribute :key, GOBL::Org::Key

      # @!attribute [r] role
      # Role assigned to this inbox that may be relevant for the consumer.
      # @return [GOBL::Org::Key]
      attribute? :role, GOBL::Org::Key.optional

      # @!attribute [r] name
      # Human name for the inbox.
      # @return [String]
      attribute? :name, GOBL::Types::String.optional

      # @!attribute [r] code
      # Actual Code or ID that identifies the Inbox.
      # @return [String]
      attribute :code, GOBL::Types::String

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          key: GOBL::Org::Key.from_gobl!(data['key']),
          role: data['role'] ? GOBL::Org::Key.from_gobl!(data['role']) : nil,
          name: data['name'],
          code: data['code']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'key' => attributes[:key]&.to_gobl,
          'role' => attributes[:role]&.to_gobl,
          'name' => attributes[:name],
          'code' => attributes[:code]
        }.compact
      end
    end
  end
end

