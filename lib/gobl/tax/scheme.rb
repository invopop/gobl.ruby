# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##

module GOBL
  module Tax
    # Scheme contains the definition of a scheme that belongs to a region and can be used to simplify validation processes for document contents.
    class Scheme < GOBL::Struct
      # The Schema ID of the GOBL Scheme structure
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
      # Note defines a message that should be added to a document when this scheme is used.
      # @return [GOBL::Org::Note]
      attribute? :note, GOBL::Org::Note.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Scheme] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          key: GOBL::Org::Key.from_gobl!(data['key']),
          name: GOBL::I18n::String.from_gobl!(data['name']),
          description: data['description'] ? GOBL::I18n::String.from_gobl!(data['description']) : nil,
          categories: data['categories']&.map { |item| GOBL::Org::Code.from_gobl!(item) },
          note: data['note'] ? GOBL::Org::Note.from_gobl!(data['note']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'key' => attributes[:key]&.to_gobl,
          'name' => attributes[:name]&.to_gobl,
          'description' => attributes[:description]&.to_gobl,
          'categories' => attributes[:categories]&.map { |item| item&.to_gobl },
          'note' => attributes[:note]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Scheme} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   The `new` method will only allow to create a new object if all attributes
      #   marked as mandatory and not calculated in the JSON schema are provided.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Scheme] the object corresponding to the given input
    end
  end
end
