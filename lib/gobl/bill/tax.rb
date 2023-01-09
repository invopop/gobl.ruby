# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.34.1
##

module GOBL
  module Bill
    # Tax defines a summary of the taxes which may be applied to an invoice.
    class Tax < GOBL::Object
      # The Schema ID of the GOBL Tax structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Tax'

      # @!attribute [r] prices_include
      # Category of the tax already included in the line item prices, especially useful for B2C retailers with customers who prefer final prices inclusive of tax.
      # @return [GOBL::Org::Code]
      property :prices_include, GOBL::Org::Code

      # @!attribute [r] schemes
      # Special tax schemes that apply to this invoice according to local requirements.
      # @return [SchemeKeys]
      property :schemes, SchemeKeys

      # @!attribute [r] meta
      # Any additional data that may be required for processing, but should never be relied upon by recipients.
      # @return [GOBL::Org::Meta]
      property :meta, GOBL::Org::Meta
    end
  end
end
