# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Org
    # DocumentRef is used to describe an existing document or a specific part of it's contents.
    class DocumentRef < GOBL::Object
      # The Schema ID of the GOBL DocumentRef structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/document-ref'

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] type
      # Type of the document referenced.
      # @return [GOBL::CBC::Key]
      property :type, GOBL::CBC::Key

      # @!attribute [r] issue_date
      # IssueDate reflects the date the document was issued.
      # @return [GOBL::Cal::Date]
      property :issue_date, GOBL::Cal::Date

      # @!attribute [r] series
      # Series the referenced document belongs to.
      # @return [GOBL::CBC::Code]
      property :series, GOBL::CBC::Code

      # @!attribute [r] code
      # Source document's code or other identifier.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code
      validates_presence_of :code

      # @!attribute [r] line
      # Line index number inside the document, if relevant.
      # @return [Integer]
      property :line, Integer

      # @!attribute [r] identities
      # List of additional codes, IDs, or SKUs which can be used to identify the document or its contents, agreed upon by the supplier and customer.
      # @return [Array<GOBL::Org::Identity>]
      property :identities, [GOBL::Org::Identity]

      # @!attribute [r] period
      # Tax period in which the referred document had an effect required by some tax regimes and formats.
      # @return [GOBL::Cal::Period]
      property :period, GOBL::Cal::Period

      # @!attribute [r] reason
      # Human readable description on why this reference is here or needs to be used.
      # @return [String]
      property :reason, String

      # @!attribute [r] description
      # Additional details about the document.
      # @return [String]
      property :description, String

      # @!attribute [r] stamps
      # Seals of approval from other organisations that may need to be listed.
      # @return [Array<GOBL::Head::Stamp>]
      property :stamps, [GOBL::Head::Stamp]

      # @!attribute [r] url
      # Link to the source document.
      # @return [String]
      property :url, String

      # @!attribute [r] ext
      # Extensions for additional codes that may be required.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions

      # @!attribute [r] meta
      # Meta contains additional information about the document.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
