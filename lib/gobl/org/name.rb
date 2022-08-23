# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

require 'dry-struct'

module GOBL
  module Org
    # Name represents what a human is called.
    class Name < Dry::Struct
      # Unique identity code
      attribute :uuid, GOBL::UUID::UUID.optional

      # What the person would like to be called
      attribute :alias, GOBL::Types::String.optional

      # Additional prefix to add to name, like Mrs. or Mr.
      attribute :prefix, GOBL::Types::String.optional

      # Person's given or first name
      attribute :given, GOBL::Types::String

      # Middle names or initials
      attribute :middle, GOBL::Types::String.optional

      # Second or Family name.
      attribute :surname, GOBL::Types::String

      # Additional second of family name.
      attribute :surname2, GOBL::Types::String.optional

      # Titles to include after the name.
      attribute :suffix, GOBL::Types::String.optional

      # Any additional useful data.
      attribute :meta, GOBL::Org::Meta.optional

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

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

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
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

