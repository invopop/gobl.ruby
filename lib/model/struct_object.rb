# frozen_string_literal: true

require 'json'
require 'json-schema'
require 'dry-struct'

module Model
  # StructObject - Abstract class that defines the core behaviour of a GoBL
  # object.
  class StructObject < Dry::Struct
    # Returns a value depending on the kind of property. If the property
    # has an associate reference definition, an instance is created.
    def self.to_struct(ref, value)
      if ref.nil?
        value
      elsif value.is_a? Array
        value.map { |e| ref.from_object!(e) }
      else
        ref.from_object!(value)
      end
    end

    def self.from_json!(json)
      return if json.nil?

      from_object!(JSON.parse(json))
    end

    # Returns a new instance, and sets its attributes with the ones in the data
    # object.
    def self.from_object!(data)
      return if data.nil?

      from_gobl!(data)
    end

    def self.from_gobl!(_data)
      raise NotImplementError
    end

    # Initialize class instance variables.
    def self.init_class(schema)
      class << self
        attr_reader :json_schema, # Expanded JSON schema.
                    :original_json_schema # Original JSON schema.
      end

      @json_schema = Marshal.load(Marshal.dump(schema))
      @original_json_schema = schema
    end

    # Properties reference dictionary.
    def self.properties_ref
      @properties_ref ||= {}
    end

    def self.to_gobl
      raise NotImplementError
    end

    def to_json(options = nil)
      JSON.generate(to_gobl, options)
    end
  end
end
