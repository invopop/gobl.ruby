# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Address < Model::Struct
      attribute :uuid, Model::Types::String.optional

      # Useful identifier
      attribute :label, Model::Types::String.optional

      # Box number or code for the post office box located at the address.
      attribute :po_box, Model::Types::String.optional

      # House or building number in the street.
      attribute :num, Model::Types::String.optional

      # Floor number within the building.
      attribute :floor, Model::Types::String.optional

      # Block number within the building.
      attribute :block, Model::Types::String.optional

      # Door number within the building.
      attribute :door, Model::Types::String.optional

      # Fist line of street.
      attribute :street, Model::Types::String.optional

      # Additional street address details.
      attribute :street_extra, Model::Types::String.optional

      # The village
      attribute :locality, Model::Types::String

      # Province
      attribute :region, Model::Types::String

      # Post or ZIP code.
      attribute :code, Model::Types::String.optional

      # ISO country code.
      attribute :country, Model::Types::String.optional

      # For when the postal address is not sufficient
      attribute :coords, GOBL::Org::Coordinates.optional

      attribute :meta, Model::Types::Hash.optional
    end
  end
end
