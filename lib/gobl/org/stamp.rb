# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.32.0
##

module GOBL
  module Org
    # Stamp defines an official seal of approval from a third party like a governmental agency or intermediary and should thus be included in any official envelopes.
    class Stamp < GOBL::Object
      # The Schema ID of the GOBL Stamp structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/stamp'

      # @!attribute [r] prv
      # Identity of the agency used to create the stamp usually defined by each region.
      # @return [GOBL::Org::Key]
      property :prv, GOBL::Org::Key
      validates :prv, presence: true

      # @!attribute [r] val
      # The serialized stamp value generated for or by the external agency
      # @return [String]
      property :val, String
      validates :val, presence: true
    end
  end
end