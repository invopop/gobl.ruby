# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Person represents a human, and how to contact them electronically.
    class Person < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/org/person'

      # @!attribute [r] id
      # Internal ID used to identify the person inside a document.
      # @return [String]
      attribute? :id, GOBL::Types::String.optional

      # @!attribute [r] uuid
      # Unique identity code
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] name
      # Complete details on the name of the person
      # @return [GOBL::Org::Name]
      attribute :name, GOBL::Org::Name

      # @!attribute [r] role
      # What they do within an organization
      # @return [String]
      attribute? :role, GOBL::Types::String.optional

      # @!attribute [r] emails
      # Electronic mail addresses that belong to the person.
      # @return [Array<GOBL::Org::Email>]
      attribute? :emails, GOBL::Types::Array.of(GOBL::Org::Email).optional

      # @!attribute [r] telephones
      # Regular phone or mobile numbers
      # @return [Array<GOBL::Org::Telephone>]
      attribute? :telephones, GOBL::Types::Array.of(GOBL::Org::Telephone).optional

      # @!attribute [r] meta
      # Data about the data.
      # @return [GOBL::Org::Meta]
      attribute? :meta, GOBL::Org::Meta.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          id: data['id'],
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          name: GOBL::Org::Name.from_gobl!(data['name']),
          role: data['role'],
          emails: data['emails']&.map { |item| GOBL::Org::Email.from_gobl!(item) },
          telephones: data['telephones']&.map { |item| GOBL::Org::Telephone.from_gobl!(item) },
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      def to_gobl
        {
          'id' => attributes[:id],
          'uuid' => attributes[:uuid]&.to_gobl,
          'name' => attributes[:name]&.to_gobl,
          'role' => attributes[:role],
          'emails' => attributes[:emails]&.map { |item| item&.to_gobl },
          'telephones' => attributes[:telephones]&.map { |item| item&.to_gobl },
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end
    end
  end
end

