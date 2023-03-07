# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.36.0
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
        'credit-transfer' => 'Sender initiated bank or wire transfer',
        'debit-transfer' => 'Receiver initiated bank or wire transfer',
        'cash' => 'Cash',
        'direct-debit' => 'Direct debit',
        'online' => 'Online or web payment'
      }.freeze

      validates_inclusion_of :_value, in: ENUM.keys, message: '"%{value}" is not within the allowed values of the enumeration'
    end
  end
end
