# frozen_string_literal: true

module GOBL
  # Base class for any structure present in the GOBL Schema
  class Struct
    # Returns a new GOBL struct from a hash of GOBL data. The type of the returned struct
    # is determined from the `$schema` attribute.
    #
    # @param data [Hash] the hash of GOBL data
    #
    # @return [GOBL::Struct] the created GOBL struct
    def self.from_data(data)
      raise ArgumentError, 'Schema not present in the given data' unless data&.key?('$schema')

      schema = GOBL::ID.new(data['$schema'])

      # This could become more sophisticated in the future. For the moment, any schema not
      # being an envelope is considered to be a document as these are the only two structures
      # that are required to specify its schema.
      if schema.name == 'envelope'
        GOBL::Envelope.new data
      else
        GOBL::Document.new data
      end
    end

    # Deserializes a GOBL struct from a JSON string
    #
    # @param json [String] the JSON string representing the GOBL struct
    #
    # @return [GOBL::Struct] the deserialized GOBL struct
    def self.from_json!(json)
      new JSON.parse(json)
    end

    # Serializes the current GOBL struct into a JSON string
    #
    # @return [String] the JSON string representing the struct
    def to_json(**args)
      as_json.to_json(**args)
    end

    # @api private
    def as_json
      raise NotImplementedError, 'Subclasses are expected to overload'
    end
  end
end
