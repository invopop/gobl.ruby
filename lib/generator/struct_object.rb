# frozen_string_literal: true

require 'json'

class Generator
  # StructObject - Abstract class that defines the core behaviour of a
  # dynamically defined object.
  class StructObject
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
  end
end
