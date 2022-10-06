# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##

module GOBL
  module Pay
    # Payment terms key
    class TermKey < GOBL::Enum
      # The Schema ID of the GOBL TermKey structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/terms#/$defs/TermKey'

      # The enumeration of values of the object and their descriptions (Values different to these are not allowed)
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
  end
end
