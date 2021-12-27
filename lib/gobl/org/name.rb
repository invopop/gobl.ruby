# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Org
    class Name < Dry::Struct
      # Unique identity code
      attribute :uuid, GOBL::UUID::UUID.optional

      # What the person would like to be called
      attribute :alias, GOBL::Types::String.optional

      attribute :prefix, GOBL::Types::String.optional

      # The person's given name
      attribute :given, GOBL::Types::String

      # Middle names or initials
      attribute :middle, GOBL::Types::String.optional

      attribute :surname, GOBL::Types::String

      attribute :surname2, GOBL::Types::String.optional

      attribute :suffix, GOBL::Types::String.optional

      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'] ? GOBL::UUID::UUID.from_gobl!(gobl['uuid']) : nil,
          alias: gobl['alias'],
          prefix: gobl['prefix'],
          given: gobl['given'],
          middle: gobl['middle'],
          surname: gobl['surname'],
          surname2: gobl['surname2'],
          suffix: gobl['suffix'],
          meta: gobl['meta']
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
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
