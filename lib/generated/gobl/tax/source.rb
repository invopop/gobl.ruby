# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # Source describes where the information for the taxes comes from.
    class Source < GOBL::Object
      # The Schema ID of the GOBL Source structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime-def#/$defs/Source'

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
