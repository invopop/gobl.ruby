# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.32.0
##

module GOBL
  module Pay
    # Method Key describes how a payment should be made
    class MethodKey < GOBL::Enum
      # The Schema ID of the GOBL MethodKey structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions#/$defs/MethodKey'

      # The enumeration of values of the object and their descriptions (Values different to these are not allowed)
      ENUM = {
        'any' => 'Any method available, no preference',
        'card' => 'Credit or debit card',
        'credit-transfer' => 'Send initiated bank or wire transfer',
        'debit-transfer' => 'Receive initiated bank or wire transfer',
        'cash' => 'Cash',
        'direct-debit' => 'Direct debit',
        'online' => 'Online or web payment'
      }.freeze

      def strict_enum?
        true
      end
    end
  end
end
