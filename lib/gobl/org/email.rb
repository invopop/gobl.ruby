# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Org
    # Email describes the electronic mailing details.
    class Email < GOBL::Struct
      # The Schema ID of the GOBL Email structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/email'

      # @!attribute [r] uuid
      # Unique identity code
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] label
      # Identifier for the email.
      # @return [String]
      attribute? :label, GOBL::Types::String.optional

      # @!attribute [r] addr
      # Electronic mailing address.
      # @return [String]
      attribute :addr, GOBL::Types::String

      # @!attribute [r] meta
      # Additional fields.
      # @return [GOBL::Org::Meta]
      attribute? :meta, GOBL::Org::Meta.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Email] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          label: data['label'],
          addr: data['addr'],
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'label' => attributes[:label],
          'addr' => attributes[:addr],
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Email} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Email] the object corresponding to the given input
    end
  end
end

