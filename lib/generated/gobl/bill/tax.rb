# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # Tax defines a summary of the taxes which may be applied to an invoice.
    class Tax < GOBL::Object
      # The Schema ID of the GOBL Tax structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Tax'

      # @!attribute [r] prices_include
      # Category of the tax already included in the line item prices, especially useful for B2C retailers with customers who prefer final prices inclusive of tax.
      # @return [GOBL::CBC::Code]
      property :prices_include, GOBL::CBC::Code

      # @!attribute [r] ext
      # Additional extensions that are applied to the invoice as a whole as opposed to specific sections.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions

      # @!attribute [r] meta
      # Any additional data that may be required for processing, but should never be relied upon by recipients.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
