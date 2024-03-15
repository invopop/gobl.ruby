# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.69.0
##

module GOBL
  module Tax
    # Source describes where the information for the taxes comes from.
    class Source < GOBL::Object
      # The Schema ID of the GOBL Source structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime#/$defs/Source'

      # @!attribute [r] title
      # Title of the linked source to help distinguish between this and other links.
      # @return [GOBL::I18n::String]
      property :title, GOBL::I18n::String

      # @!attribute [r] url
      # URL for the website.
      # @return [String]
      property :url, String
      validates_presence_of :url
    end
  end
end
