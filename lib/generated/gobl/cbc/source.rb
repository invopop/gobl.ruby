# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module CBC
    # Source is used to identify a specific source of data.
    class Source < GOBL::Object
      # The Schema ID of the GOBL Source structure
      SCHEMA_ID = 'https://gobl.org/draft-0/cbc/source'

      # @!attribute [r] title
      # Title stores the name of the source of information.
      # @return [GOBL::I18n::String]
      property :title, GOBL::I18n::String

      # @!attribute [r] url
      # URL is the location of the source of information.
      # @return [String]
      property :url, String
      validates_presence_of :url

      # @!attribute [r] content_type
      # ContentType of the information expected at the URL.
      # @return [String]
      property :content_type, String

      # @!attribute [r] at
      # At is the date and time the information was retrieved.
      # @return [GOBL::Cal::DateTime]
      property :at, GOBL::Cal::DateTime
    end
  end
end
