# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Org
    # Address defines a globally acceptable set of attributes that describes a postal or fiscal address.
    class Address < GOBL::Object
      # The Schema ID of the GOBL Address structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/address'

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] label
      # Useful identifier, such as home, work, etc.
      # @return [String]
      property :label, String

      # @!attribute [r] po_box
      # Box number or code for the post office box located at the address.
      # @return [String]
      property :po_box, String

      # @!attribute [r] num
      # House or building number in the street.
      # @return [String]
      property :num, String

      # @!attribute [r] floor
      # Floor number within the building.
      # @return [String]
      property :floor, String

      # @!attribute [r] block
      # Block number within the building.
      # @return [String]
      property :block, String

      # @!attribute [r] door
      # Door number within the building.
      # @return [String]
      property :door, String

      # @!attribute [r] street
      # First line of street.
      # @return [String]
      property :street, String

      # @!attribute [r] street_extra
      # Additional street address details.
      # @return [String]
      property :street_extra, String

      # @!attribute [r] locality
      # Name of a village, town, district, or city, typically inside a region.
      # @return [String]
      property :locality, String

      # @!attribute [r] region
      # Name of a city, province, county, or state, inside a country.
      # @return [String]
      property :region, String

      # @!attribute [r] state
      # State or province code for countries that require it.
      # @return [GOBL::CBC::Code]
      property :state, GOBL::CBC::Code

      # @!attribute [r] code
      # Post or ZIP code.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] country
      # ISO country code.
      # @return [GOBL::L10n::ISOCountryCode]
      property :country, GOBL::L10n::ISOCountryCode

      # @!attribute [r] coords
      # When the postal address is not sufficient, coordinates help locate the address more precisely.
      # @return [GOBL::Org::Coordinates]
      property :coords, GOBL::Org::Coordinates

      # @!attribute [r] meta
      # Any additional semi-structure details about the address.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
