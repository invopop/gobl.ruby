# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.34.1
##

module GOBL
  module Pay
    # Terms defines when we expect the customer to pay, or have paid, for the contents of the document.
    class Terms < GOBL::Object
      # The Schema ID of the GOBL Terms structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/terms'

      # @!attribute [r] key
      # Type of terms to be applied.
      # @return [TermKey]
      property :key, TermKey
      validates :key, presence: true

      # @!attribute [r] detail
      # Text detail of the chosen payment terms.
      # @return [String]
      property :detail, String

      # @!attribute [r] due_dates
      # Set of dates for agreed payments.
      # @return [Array<DueDate>]
      property :due_dates, [DueDate]

      # @!attribute [r] notes
      # Description of the conditions for payment.
      # @return [String]
      property :notes, String
    end
  end
end
