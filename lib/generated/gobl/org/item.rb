# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Org
    # Item is used to describe a single product or service.
    class Item < GOBL::Object
      # The Schema ID of the GOBL Item structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/item'

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] ref
      # Primary reference code that identifies this item. Additional codes can be provided in the 'identities' property.
      # @return [GOBL::CBC::Code]
      property :ref, GOBL::CBC::Code

      # @!attribute [r] key
      # Special key used to classify the item sometimes required by some regimes.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] name
      # Brief name of the item
      # @return [String]
      property :name, String
      validates_presence_of :name

      # @!attribute [r] identities
      # List of additional codes, IDs, or SKUs which can be used to identify the item. They should be agreed upon between supplier and customer.
      # @return [Array<GOBL::Org::Identity>]
      property :identities, [GOBL::Org::Identity]

      # @!attribute [r] description
      # Detailed description of the item.
      # @return [String]
      property :description, String

      # @!attribute [r] currency
      # Currency used for the item's price.
      # @return [GOBL::Currency::Code]
      property :currency, GOBL::Currency::Code

      # @!attribute [r] price
      # Base price of a single unit to be sold.
      # @return [GOBL::Num::Amount]
      property :price, GOBL::Num::Amount

      # @!attribute [r] alt_prices
      # AltPrices defines a list of prices with their currencies that may be used as an alternative to the item's base price.
      # @return [Array<GOBL::Currency::Amount>]
      property :alt_prices, [GOBL::Currency::Amount]

      # @!attribute [r] unit
      # Unit of measure.
      # @return [GOBL::Org::Unit]
      property :unit, GOBL::Org::Unit

      # @!attribute [r] origin
      # Country code of where this item was from originally.
      # @return [GOBL::L10n::ISOCountryCode]
      property :origin, GOBL::L10n::ISOCountryCode

      # @!attribute [r] ext
      # Extension code map for any additional regime specific codes that may be required.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions

      # @!attribute [r] meta
      # Additional meta information that may be useful
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
