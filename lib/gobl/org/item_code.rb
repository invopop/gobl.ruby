# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.34.1
##

module GOBL
  module Org
    # ItemCode contains a value and optional label property that means additional codes can be added to an item.
    class ItemCode < GOBL::Object
      # The Schema ID of the GOBL ItemCode structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/item#/$defs/ItemCode'

      # @!attribute [r] label
      # Local or human reference for the type of code the value represents.
      # @return [String]
      property :label, String

      # @!attribute [r] value
      # The item code's value.
      # @return [String]
      property :value, String
      validates :value, presence: true
    end
  end
end
