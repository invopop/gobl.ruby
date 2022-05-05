# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Tax
    class Scheme < Dry::Struct
      # Key used to identify this scheme
      attribute :key, GOBL::Types::String

      # Name of this scheme.
      attribute :name, GOBL::I18n::String

      # Human details describing what this scheme is used for.
      attribute :description, GOBL::I18n::String.optional

      # List of tax category codes that can be used when this scheme is applied.
      attribute :categories, GOBL::Types::Array(GOBL::Types::String).optional

      # Notes defines messages that should be added to a document when this scheme is used.
      attribute :note, GOBL::Org::Note.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          key: data['key'],
          name: GOBL::I18n::String.from_gobl!(data['name']),
          description: data['description'] ? GOBL::I18n::String.from_gobl!(data['description']) : nil,
          categories: data['categories']&.map { |item| item },
          note: data['note'] ? GOBL::Org::Note.from_gobl!(data['note']) : nil
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'key' => attributes[:key],
          'name' => attributes[:name]&.to_gobl,
          'description' => attributes[:description]&.to_gobl,
          'categories' => attributes[:categories]&.map { |item| item },
          'note' => attributes[:note]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
