# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.34.1
##

module GOBL
  module Org
    # NoteKey identifies the type of note being edited
    class NoteKey < GOBL::Enum
      # The Schema ID of the GOBL NoteKey structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/note#/$defs/NoteKey'

      # The enumeration of values of the object and their descriptions (Values different to these are not allowed)
      ENUM = {
        'goods' => 'Goods Description',
        'payment' => 'Terms of Payment',
        'legal' => 'Legal or regulatory information',
        'dangerous-goods' => 'Dangerous goods additional information',
        'ack' => 'Acknowledgement Description',
        'rate' => 'Rate additional information',
        'reason' => 'Reason',
        'dispute' => 'Dispute',
        'customer' => 'Customer remarks',
        'glossary' => 'Glossary',
        'customs' => 'Customs declaration information',
        'general' => 'General information',
        'handling' => 'Handling instructions',
        'packaging' => 'Packaging information',
        'loading' => 'Loading instructions',
        'price' => 'Price conditions',
        'priority' => 'Priority information',
        'regulatory' => 'Regulatory information',
        'safety' => 'Safety instructions',
        'ship-line' => 'Ship line',
        'supplier' => 'Supplier remarks',
        'transport' => 'Transportation information',
        'delivery' => 'Delivery information',
        'quarantine' => 'Quarantine information',
        'tax' => 'Tax declaration'
      }.freeze

      def strict_enum?
        true
      end
    end
  end
end
