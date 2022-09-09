# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Tax
    # Scheme contains the definition of a scheme that belongs to a region and can be used to simplify validation processes for document contents.
    class Scheme < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/region#/$defs/Scheme'

      # @!attribute [r] key
      # Key used to identify this scheme
      # @return [GOBL::Org::Key]
      attribute :key, GOBL::Org::Key

      # @!attribute [r] name
      # Name of this scheme.
      # @return [GOBL::I18n::String]
      attribute :name, GOBL::I18n::String

      # @!attribute [r] description
      # Human details describing what this scheme is used for.
      # @return [GOBL::I18n::String]
      attribute? :description, GOBL::I18n::String.optional

      # @!attribute [r] categories
      # List of tax category codes that can be used when this scheme is applied.
      # @return [Array<GOBL::Org::Code>]
      attribute? :categories, GOBL::Types::Array.of(GOBL::Org::Code).optional

      # @!attribute [r] note
      # Notes defines messages that should be added to a document when this scheme is used.
      # @return [Note]
      attribute? :note, Note.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          key: GOBL::Org::Key.from_gobl!(data['key']),
          name: GOBL::I18n::String.from_gobl!(data['name']),
          description: data['description'] ? GOBL::I18n::String.from_gobl!(data['description']) : nil,
          categories: data['categories']&.map { |item| GOBL::Org::Code.from_gobl!(item) },
          note: data['note'] ? Note.from_gobl!(data['note']) : nil
        )
      end

      def to_gobl
        {
          'key' => attributes[:key]&.to_gobl,
          'name' => attributes[:name]&.to_gobl,
          'description' => attributes[:description]&.to_gobl,
          'categories' => attributes[:categories]&.map { |item| item&.to_gobl },
          'note' => attributes[:note]&.to_gobl
        }.compact
      end
    end
  end
end

