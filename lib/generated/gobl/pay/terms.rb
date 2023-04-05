# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.42.0
##

module GOBL
  module Pay
    # Terms defines when we expect the customer to pay, or have paid, for the contents of the document.
    class Terms < GOBL::Object
      # The Schema ID of the GOBL Terms structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/terms'

      # Enumeration of possible values for {#key} with their corresponding descriptions
      KEY_ENUM = {
        '' => 'Not yet defined',
        'end-of-month' => 'End of month',
        'due-date' => 'Due on a specific date',
        'deferred' => 'Deferred until after the due date',
        'proximo' => 'Month after the present',
        'instant' => 'On receipt of invoice',
        'elective' => 'Chosen by the buyer',
        'pending' => 'Seller to advise buyer in separate transaction',
        'advance' => 'Payment made in advance',
        'delivery' => 'Payment on Delivery'
      }.freeze

      # @!attribute [r] key
      # Type of terms to be applied.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key
      validates_presence_of :key
      validates_inclusion_of :key, in: KEY_ENUM.keys

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
