# frozen_string_literal: true

module GOBL
  # Base class for any GOBL structure
  class Struct < Dry::Struct
    def self.from_json!(json)
      from_gobl!(JSON.parse(json))
    end

    def to_json(options = nil)
      JSON.generate(to_gobl, options)
    end
  end
end
