# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Head
    # Link defines a link between this document and another resource.
    class Link < GOBL::Object
      # The Schema ID of the GOBL Link structure
      SCHEMA_ID = 'https://gobl.org/draft-0/head/link'

      # @!attribute [r] key
      # Key is a unique identifier for the link.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key
      validates_presence_of :key

      # @!attribute [r] title
      # Title of the resource to use when presenting to users.
      # @return [String]
      property :title, String

      # @!attribute [r] description
      # Description of the resource to use when presenting to users.
      # @return [String]
      property :description, String

      # @!attribute [r] mime
      # Expected MIME type of the link's content.
      # @return [String]
      property :mime, String

      # @!attribute [r] url
      # URL of the resource.
      # @return [String]
      property :url, String
      validates_presence_of :url
    end
  end
end
