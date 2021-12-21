# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class Name < Model::Struct
      # Unique identity code
      attribute :uuid, Model::Types::String.optional

      # What the person would like to be called
      attribute :alias, Model::Types::String.optional

      attribute :prefix, Model::Types::String.optional

      # The person's given name
      attribute :given, Model::Types::String

      # Middle names or initials
      attribute :middle, Model::Types::String.optional

      attribute :surname, Model::Types::String

      attribute :surname2, Model::Types::String.optional

      attribute :suffix, Model::Types::String.optional

      attribute :meta, Model::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
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

      def to_gobl
        {
          'uuid' => attributes[:uuid],
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
    end
  end
end
