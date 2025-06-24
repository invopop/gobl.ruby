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
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/tax'

      # @!attribute [r] prices_include
      # Category of the tax already included in the line item prices, especially useful for B2C retailers with customers who prefer final prices inclusive of tax.
      # @return [GOBL::CBC::Code]
      property :prices_include, GOBL::CBC::Code

      # Enumeration of possible values for {#rounding} with their corresponding descriptions
      ROUNDING_ENUM = {
        'precise' => 'The default method of calculating the totals in GOBL, and provides the best results
      for most cases as the precision is maintained to the maximum amount possible. The
      tradeoff however is that sometimes the totals may not sum exactly based on what is visible.',
        'currency' => 'The alternative method of calculating the totals that will first round all the amounts
      to the currencys precision before making the sums. Totals using this approach can always
      be recalculated using the amounts presented, but can lead to rounding errors in the case
      of pre-payments and when line item prices include tax.s precision before making the sums. Totals using this approach can always
      be recalculated using the amounts presented, but can lead to rounding errors in the case
      of pre-payments and when line item prices include tax.'
      }.freeze

      # @!attribute [r] rounding
      # Rounding model used to perform tax calculations on the invoice. This will be configured automatically based on the tax regime, or `sum-then-round` by default, but you can override here if needed. Use with caution, as some conversion tools may make assumptions about the rounding model used.
      # @return [GOBL::CBC::Key]
      property :rounding, GOBL::CBC::Key
      validates_inclusion_of :rounding, in: ROUNDING_ENUM.keys, allow_blank: true

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
