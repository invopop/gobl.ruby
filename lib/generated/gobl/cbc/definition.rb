# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module CBC
    # Definition defines properties of a key, code, or other value that has a specific meaning or utility.
    class Definition < GOBL::Object
      # The Schema ID of the GOBL Definition structure
      SCHEMA_ID = 'https://gobl.org/draft-0/cbc/definition'

      # @!attribute [r] key
      # Key being defined.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] code
      # Code this definition represents.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] name
      # Short name for the key.
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String
      validates_presence_of :name

      # @!attribute [r] desc
      # Description offering more details about when the key should be used.
      # @return [GOBL::I18n::String]
      property :desc, GOBL::I18n::String

      # @!attribute [r] meta
      # Meta defines any additional details that may be useful or associated with the key.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta

      # @!attribute [r] sources
      # Where the information was sourced from.
      # @return [Array<GOBL::CBC::Source>]
      property :sources, [GOBL::CBC::Source]

      # @!attribute [r] values
      # Values defines the possible values associated with the key, which themselves will either be keys or codes depending on the context.
      # @return [Array<GOBL::CBC::Definition>]
      property :values, [GOBL::CBC::Definition]

      # @!attribute [r] pattern
      # Pattern is used to validate the key value instead of using a fixed value from the code or key definitions.
      # @return [String]
      property :pattern, String

      # @!attribute [r] map
      # Map helps map local keys to specific codes, useful for converting the described key into a local code.
      # @return [GOBL::CBC::CodeMap]
      property :map, GOBL::CBC::CodeMap
    end
  end
end
