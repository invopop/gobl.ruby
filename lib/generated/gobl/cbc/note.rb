# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.69.0
##

module GOBL
  module CBC
    # Note represents a free text of additional information that may be added to a document.
    class Note < GOBL::Object
      # The Schema ID of the GOBL Note structure
      SCHEMA_ID = 'https://gobl.org/draft-0/cbc/note'

      # Enumeration of possible values for {#key} with their corresponding descriptions
      KEY_ENUM = {
        'goods' => 'Goods Description',
        'payment' => 'Terms of Payment',
        'legal' => 'Legal or regulatory information',
        'dangerous-goods' => 'Dangerous goods additional information',
        'ack' => 'Acknowledgement Description',
        'rate' => 'Rate additional information',
        'reason' => 'Explanation of something relevant to the document',
        'dispute' => 'Details on a dispute.',
        'customer' => 'Customer remarks',
        'glossary' => 'Glossary of terms',
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

      # @!attribute [r] key
      # Key specifying subject of the text
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key
      validates_inclusion_of :key, in: KEY_ENUM.keys, allow_blank: true

      # @!attribute [r] code
      # Code used for additional data that may be required to identify the note.
      # @return [String]
      property :code, String

      # @!attribute [r] src
      # Source of this note, especially useful when auto-generated.
      # @return [GOBL::CBC::Key]
      property :src, GOBL::CBC::Key

      # @!attribute [r] text
      # The contents of the note
      # @return [String]
      property :text, String
      validates_presence_of :text

      # @!attribute [r] meta
      # Additional information about the note
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
