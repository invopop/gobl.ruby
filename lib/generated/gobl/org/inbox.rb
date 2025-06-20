# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Org
    # Inbox is used to store data about a connection with a service that is responsible for automatically receiving copies of GOBL envelopes or other document formats.
    class Inbox < GOBL::Object
      # The Schema ID of the GOBL Inbox structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/inbox'

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] label
      # Label for the inbox.
      # @return [String]
      property :label, String

      # @!attribute [r] key
      # Type of inbox being defined if required for clarification between multiple inboxes.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] scheme
      # Scheme ID of the code used to identify the inbox. This is context specific and usually an ISO 6523 code or CEF (Connecting Europe Facility) code.
      # @return [GOBL::CBC::Code]
      property :scheme, GOBL::CBC::Code

      # @!attribute [r] code
      # Code or ID that identifies the Inbox. Mutually exclusive with URL and Email.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] url
      # URL of the inbox that includes the protocol, server, and path. May be used instead of the Code to identify the inbox. Mutually exclusive with Code and Email.
      # @return [String]
      property :url, String

      # @!attribute [r] email
      # Email address for the inbox. Mutually exclusive with Code and URL.
      # @return [String]
      property :email, String
    end
  end
end
