# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.38.0
##

module GOBL
  module CBC
    # Stamp defines an official seal of approval from a third party like a governmental agency or intermediary and should thus be included in any official envelopes.
    class Stamp < GOBL::Object
      # The Schema ID of the GOBL Stamp structure
      SCHEMA_ID = 'https://gobl.org/draft-0/cbc/stamp'

      # @!attribute [r] prv
      # Identity of the agency used to create the stamp usually defined by each region.
      # @return [GOBL::CBC::Key]
      property :prv, GOBL::CBC::Key
      validates_presence_of :prv

      # @!attribute [r] val
      # The serialized stamp value generated for or by the external agency
      # @return [String]
      property :val, String
      validates_presence_of :val
    end
  end
end
