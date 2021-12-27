# frozen_string_literal: true

require 'json'
require 'dry-struct'

module GOBL
  # Struct - Abstract class that defines the core behaviour of a GoBL
  # object.
  class Struct < Dry::Struct
    def self.from_json!(json)
      return if json.nil?

      from_object!(JSON.parse(json))
    end

    def self.from_object!(data)
      return if data.nil?

      from_gobl!(data)
    end

    def self.from_gobl!(_data)
      raise NotImplementError
    end

    def to_gobl
      raise NotImplementError
    end

    def to_json(options = nil)
      JSON.generate(to_gobl, options)
    end
  end
end
