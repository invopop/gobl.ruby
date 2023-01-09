# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.34.1
##

module GOBL
  module Tax
    # Scheme contains the definition of a scheme that belongs to a region and can be used to simplify validation processes for document contents.
    class Scheme < GOBL::Object
      # The Schema ID of the GOBL Scheme structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/region#/$defs/Scheme'

      # @!attribute [r] key
      # Key used to identify this scheme
      # @return [GOBL::Org::Key]
      property :key, GOBL::Org::Key
      validates :key, presence: true

      # @!attribute [r] name
      # Name of this scheme.
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String
      validates :name, presence: true

      # @!attribute [r] description
      # Human details describing what this scheme is used for.
      # @return [GOBL::I18n::String]
      property :description, GOBL::I18n::String

      # @!attribute [r] categories
      # List of tax category codes that can be used when this scheme is applied.
      # @return [Array<GOBL::Org::Code>]
      property :categories, [GOBL::Org::Code]

      # @!attribute [r] note
      # Note defines a message that should be added to a document when this scheme is used.
      # @return [GOBL::Org::Note]
      property :note, GOBL::Org::Note
    end
  end
end
