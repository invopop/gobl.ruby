# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Org
    # An Attachment provides a structure to be used to attach documents inside a GOBL document, either as a reference via a URL, or directly as a base64 encoded string.
    class Attachment < GOBL::Object
      # The Schema ID of the GOBL Attachment structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/attachment'

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] key
      # Key used to identify the attachment inside the document.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] code
      # Code used to identify the payload of the attachment.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] name
      # Filename of the attachment.
      # @return [String]
      property :name, String
      validates_presence_of :name

      # @!attribute [r] description
      # Details of why the attachment is being included and details on what it contains.
      # @return [String]
      property :description, String

      # @!attribute [r] url
      # URL of where to find the attachment. Prefer using this field over the Data field.
      # @return [String]
      property :url, String

      # @!attribute [r] digest
      # Digest is used to verify the integrity of the attachment when downloaded from the URL.
      # @return [GOBL::DSig::Digest]
      property :digest, GOBL::DSig::Digest

      # @!attribute [r] mime
      # MIME type of the attachment.
      # @return [String]
      property :mime, String
    end
  end
end
