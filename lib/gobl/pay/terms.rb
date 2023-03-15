# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.38.0
##

module GOBL
  module Pay
    # Terms defines when we expect the customer to pay, or have paid, for the contents of the document.
    class Terms < GOBL::Object
      # The Schema ID of the GOBL Terms structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/terms'

      # Inline enum type for the `key` property
      class KeyEnum < GOBL::CBC::Key
        include GOBL::Enum

        ENUM = {
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

        def strict_enum?
          true
        end
      end

      # @!attribute [r] key
      # Type of terms to be applied.
      # @return [KeyEnum]
      property :key, KeyEnum
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
