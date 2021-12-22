# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class Person < Model::Struct
      # Unique identity code
      attribute :uuid, Model::Types::String.optional

      # Complete details on the name of the person
      attribute :name, GOBL::Org::Name

      # What they do within an organization
      attribute :role, Model::Types::String.optional

      # Electronic mail addresses that belong to the person.
      attribute :emails, Model::Types::Array(GOBL::Org::Email).optional

      # Data about the data.
      attribute :meta, Model::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
          name: GOBL::Org::Name.from_gobl!(gobl['name']),
          role: gobl['role'],
          emails: gobl['emails']&.map { |x| GOBL::Org::Email.from_gobl!(x) },
          meta: gobl['meta']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid],
          'name' => attributes[:name]&.to_gobl,
          'role' => attributes[:role],
          'emails' => attributes[:emails]&.map { |x| x&.to_gobl },
          'meta' => attributes[:meta]
        }
      end
    end
  end
end
