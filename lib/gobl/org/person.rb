# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class Person < GOBL::Struct
      # Unique identity code
      attribute :uuid, GOBL::UUID::UUID.optional

      # Complete details on the name of the person
      attribute :name, GOBL::Org::Name

      # What they do within an organization
      attribute :role, GOBL::Types::String.optional

      # Electronic mail addresses that belong to the person.
      attribute :emails, GOBL::Types::Array(GOBL::Org::Email).optional

      # Data about the data.
      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'] ? GOBL::UUID::UUID.from_gobl!(gobl['uuid']) : nil,
          name: GOBL::Org::Name.from_gobl!(gobl['name']),
          role: gobl['role'],
          emails: gobl['emails']&.map { |x| GOBL::Org::Email.from_gobl!(x) },
          meta: gobl['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'name' => attributes[:name]&.to_gobl,
          'role' => attributes[:role],
          'emails' => attributes[:emails]&.map { |x| x&.to_gobl },
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
