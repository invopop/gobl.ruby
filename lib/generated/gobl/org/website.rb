# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Org
    # Website describes what is expected for a web address.
    class Website < GOBL::Object
      # The Schema ID of the GOBL Website structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/website'

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] label
      # Label for the website to show alongside the URL.
      # @return [String]
      property :label, String

      # @!attribute [r] title
      # Title of the website to help distinguish between this and other links.
      # @return [String]
      property :title, String

      # @!attribute [r] url
      # URL for the website.
      # @return [String]
      property :url, String
      validates_presence_of :url
    end
  end
end
