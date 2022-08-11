# frozen_string_literal: true

module Parser
  # Wraps a schema composition, i.e. anyOf, oneOf, allOf
  class Composition
    attr_reader :type

    def initialize(type, data)
      @type = type
      @data = data
    end

    def entries
      @entries ||= @data.map { |e| Schema.new(e) }
    end
  end
end
