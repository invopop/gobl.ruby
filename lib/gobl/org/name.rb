# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##


module GOBL
  module Org
    # Name represents what a human is called.
    class Name < GOBL::Struct
      # The Schema ID of the GOBL Name structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/name'

      # @!attribute [r] uuid
      # Unique identity code
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] alias
      # What the person would like to be called
      # @return [String]
      attribute? :alias, GOBL::Types::String.optional

      # @!attribute [r] prefix
      # Additional prefix to add to name, like Mrs. or Mr.
      # @return [String]
      attribute? :prefix, GOBL::Types::String.optional

      # @!attribute [r] given
      # Person's given or first name
      # @return [String]
      attribute :given, GOBL::Types::String

      # @!attribute [r] middle
      # Middle names or initials
      # @return [String]
      attribute? :middle, GOBL::Types::String.optional

      # @!attribute [r] surname
      # Second or Family name.
      # @return [String]
      attribute :surname, GOBL::Types::String

      # @!attribute [r] surname2
      # Additional second of family name.
      # @return [String]
      attribute? :surname2, GOBL::Types::String.optional

      # @!attribute [r] suffix
      # Titles to include after the name.
      # @return [String]
      attribute? :suffix, GOBL::Types::String.optional

      # @!attribute [r] meta
      # Any additional useful data.
      # @return [GOBL::Org::Meta]
      attribute? :meta, GOBL::Org::Meta.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Name] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          alias: data['alias'],
          prefix: data['prefix'],
          given: data['given'],
          middle: data['middle'],
          surname: data['surname'],
          surname2: data['surname2'],
          suffix: data['suffix'],
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'alias' => attributes[:alias],
          'prefix' => attributes[:prefix],
          'given' => attributes[:given],
          'middle' => attributes[:middle],
          'surname' => attributes[:surname],
          'surname2' => attributes[:surname2],
          'suffix' => attributes[:suffix],
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Name} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Name] the object corresponding to the given input
    end
  end
end

