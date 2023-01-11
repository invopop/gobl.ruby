# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.34.1
##

module GOBL
  module Org
    # Item is used to describe a single product or service.
    class Item < GOBL::Object
      # The Schema ID of the GOBL Item structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/item'

      # @!attribute [r] uuid
      # Unique identify of this item independent of the Supplier IDs
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] ref
      # Primary reference code that identifies this item. Additional codes can be provided in the 'codes' field.
      # @return [String]
      property :ref, String

      # @!attribute [r] name
      # Brief name of the item
      # @return [String]
      property :name, String
      validates :name, presence: true

      # @!attribute [r] desc
      # Detailed description
      # @return [String]
      property :desc, String

      # @!attribute [r] currency
      # Currency used for the item's price.
      # @return [String]
      property :currency, String

      # @!attribute [r] price
      # Base price of a single unit to be sold.
      # @return [GOBL::Num::Amount]
      property :price, GOBL::Num::Amount
      validates :price, presence: true

      # @!attribute [r] unit
      # Unit of measure.
      # @return [GOBL::Org::Unit]
      property :unit, GOBL::Org::Unit

      # @!attribute [r] codes
      # List of additional codes, IDs, or SKUs which can be used to identify the item. The should be agreed upon between supplier and customer.
      # @return [Array<ItemCode>]
      property :codes, [ItemCode]

      # @!attribute [r] origin
      # Country code of where this item was from originally.
      # @return [GOBL::L10n::CountryCode]
      property :origin, GOBL::L10n::CountryCode

      # @!attribute [r] meta
      # Additional meta information that may be useful
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
