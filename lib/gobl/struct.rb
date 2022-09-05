# frozen_string_literal: true

module GOBL
  # Base class for any GOBL structure
  class Struct < Dry::Struct
    def self.from_gobl!(data)
      raise ArgumentError, 'Schema not present in the given data' unless data&.key?('$schema')

      schema = GOBL::ID.new(data['$schema'])

      # This could become more sophisticated in the future. For the moment, any schema not
      # being an envelope is considered to be a document as these are the only two structures
      # that are required to specify its schema.
      if schema.name == 'envelope'
        GOBL::Envelope.from_gobl! data
      else
        GOBL::Document.from_gobl! data
      end
    end

    def self.from_json!(json)
      from_gobl!(JSON.parse(json))
    end

    def to_json(options = nil)
      JSON.generate(to_gobl, options)
    end
  end
end
