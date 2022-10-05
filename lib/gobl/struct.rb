# frozen_string_literal: true

module GOBL
  # Base class for any GOBL structure
  class Struct < Dry::Struct
    # Returns a new GOBL struct from a hash of GOBL data. The type of the returned struct
    # is determined from the `$schema` attribute.
    #
    # This method is usually overwritten at sub-class level, where the `$schema` attribute
    # isn't necessary since the type is determined by the sub-class itself.
    #
    # @param data [Hash] the hash of GOBL data
    #
    # @return [GOBL::Struct] the created GOBL struct
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

    # Deserializes a GOBL struct from a JSON string
    #
    # @param json [String] the JSON string representing the GOBL struct
    #
    # @return [GOBL::Struct] the deserialized GOBL struct
    def self.from_json!(json)
      from_gobl!(JSON.parse(json))
    end

    # Serializes a GOBL struct into a JSON string
    #
    # @param options [#to_h] a Hash-like object to pass to `JSON.generate`
    #
    # @return [GOBL::Struct] the JSON string representing the GOBL struct
    def to_json(options = nil)
      JSON.generate(to_gobl, options)
    end
  end
end
