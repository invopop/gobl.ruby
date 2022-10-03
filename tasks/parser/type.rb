# frozen_string_literal: true

module Parser
  # Type provides a wrapper around the schema "Type" that makes it
  # easier to determine what is possible.
  class Type
    def initialize(val)
      @val = val
    end

    def null?
      @val.eql?('null')
    end

    def array?
      @val.eql?('array')
    end

    def object?
      @val.eql?('object')
    end

    def string?
      @val.eql?('string')
    end

    def number?
      @val.eql?('number')
    end

    def to_s
      @val
    end
  end
end
