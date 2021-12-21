# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class TaxID < Model::Struct
      # Unique identity code
      attribute :uuid, Model::Types::String.optional

      # ISO country code for Where the tax identity was issued.
      attribute :country, Model::Types::String

      # Identity code.
      attribute :code, Model::Types::String

      # Additional details.
      attribute :meta, Model::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
          country: gobl['country'],
          code: gobl['code'],
          meta: gobl['meta']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid],
          'country' => attributes[:country],
          'code' => attributes[:code],
          'meta' => attributes[:meta]
        }
      end
    end
  end
end
