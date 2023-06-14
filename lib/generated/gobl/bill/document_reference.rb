# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.50.5
##

module GOBL
  module Bill
    # DocumentReference provides a link to a existing document.
    class DocumentReference < GOBL::Object
      # The Schema ID of the GOBL DocumentReference structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/DocumentReference'

      # @!attribute [r] uuid
      # Unique ID copied from the source document.
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] series
      # Series the reference document belongs to.
      # @return [String]
      property :series, String

      # @!attribute [r] code
      # Source document's code or other identifier.
      # @return [String]
      property :code, String

      # @!attribute [r] url
      # Link to the source document.
      # @return [String]
      property :url, String
    end
  end
end
