# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Org
    # Identity is used to define a code for a specific context.
    class Identity < GOBL::Object
      # The Schema ID of the GOBL Identity structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/identity'

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] label
      # Optional label useful for non-standard identities to give a bit more context.
      # @return [String]
      property :label, String

      # @!attribute [r] country
      # Country from which the identity was issued.
      # @return [GOBL::L10n::ISOCountryCode]
      property :country, GOBL::L10n::ISOCountryCode

      # @!attribute [r] key
      # Uniquely classify this identity using a key instead of a type.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] type
      # The type of Code being represented and usually specific for a particular context, country, or tax regime, and cannot be used alongside the key.
      # @return [GOBL::CBC::Code]
      property :type, GOBL::CBC::Code

      # @!attribute [r] code
      # The actual value of the identity code.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code
      validates_presence_of :code

      # @!attribute [r] description
      # Description adds details about what the code could mean or imply
      # @return [String]
      property :description, String

      # @!attribute [r] ext
      # Ext provides a way to add additional information to the identity.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions
    end
  end
end
