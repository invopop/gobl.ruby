# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Item is used to describe a single product or service.
    class Item < GOBL::Struct
      # The Schema ID of the GOBL Item structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/item'

      # @!attribute [r] uuid
      # Unique identify of this item independent of the Supplier IDs
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] ref
      # Primary reference code that identifies this item. Additional codes can be provided in the 'codes' field.
      # @return [String]
      attribute? :ref, GOBL::Types::String.optional

      # @!attribute [r] name
      # Brief name of the item
      # @return [String]
      attribute :name, GOBL::Types::String

      # @!attribute [r] desc
      # Detailed description
      # @return [String]
      attribute? :desc, GOBL::Types::String.optional

      # @!attribute [r] currency
      # Currency used for the item's price.
      # @return [String]
      attribute? :currency, GOBL::Types::String.optional

      # @!attribute [r] price
      # Base price of a single unit to be sold.
      # @return [GOBL::Num::Amount]
      attribute :price, GOBL::Types.Constructor(GOBL::Num::Amount)

      # @!attribute [r] unit
      # Unit of measure.
      # @return [GOBL::Org::Unit]
      attribute? :unit, GOBL::Org::Unit.optional

      # @!attribute [r] codes
      # List of additional codes, IDs, or SKUs which can be used to identify the item. The should be agreed upon between supplier and customer.
      # @return [Array<ItemCode>]
      attribute? :codes, GOBL::Types::Array.of(ItemCode).optional

      # @!attribute [r] origin
      # Country code of where this item was from originally.
      # @return [GOBL::L10n::CountryCode]
      attribute? :origin, GOBL::L10n::CountryCode.optional

      # @!attribute [r] meta
      # Additional meta information that may be useful
      # @return [GOBL::Org::Meta]
      attribute? :meta, GOBL::Org::Meta.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Item] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          ref: data['ref'],
          name: data['name'],
          desc: data['desc'],
          currency: data['currency'],
          price: data['price'],
          unit: data['unit'] ? GOBL::Org::Unit.from_gobl!(data['unit']) : nil,
          codes: data['codes']&.map { |item| ItemCode.from_gobl!(item) },
          origin: data['origin'] ? GOBL::L10n::CountryCode.from_gobl!(data['origin']) : nil,
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'ref' => attributes[:ref],
          'name' => attributes[:name],
          'desc' => attributes[:desc],
          'currency' => attributes[:currency],
          'price' => attributes[:price]&.to_gobl,
          'unit' => attributes[:unit]&.to_gobl,
          'codes' => attributes[:codes]&.map { |item| item&.to_gobl },
          'origin' => attributes[:origin]&.to_gobl,
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Item} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Item] the object corresponding to the given input
    end
  end
end

