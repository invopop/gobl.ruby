# frozen_string_literal: true

module Parser
  # JSON schema object wrapper. A JSON Schema is quite a generic term, so we define a multitude
  # of methods here.
  class Schema
    def initialize(data)
      @data = data
    end

    def id
      @id ||= ID.new(@data['$id']) if @data['$id'].present?
    end

    def definitions
      @defs ||= (@data['$defs'] || {}).transform_values do |v|
        Schema.new(v)
      end
    end

    def comment
      @data['$comment']
    end

    # Hash of property keys to more schemas
    def properties
      @props ||= (@data['properties'] || {}).transform_values do |v|
        Schema.new(v)
      end
    end

    def required
      @data['required'] || []
    end

    # is the provided property required by this schema?
    def required?(property)
      required.include?(property)
    end

    def ref
      @ref ||= ID.new(@data['$ref']) if @data['$ref'].present?
    end

    def title
      @data['title']
    end

    def description
      @data['description']
    end

    def const
      @data['const']
    end

    def const?
      @data.has_key?('const')
    end

    def type
      @data['type'].present? ? Type.new(@data['type']) : nil
    end

    def items
      @items ||= (@data['items'].present? ? Schema.new(@data['items']) : nil)
    end

    def composition
      composition_data = @data.slice('anyOf', 'oneOf', 'allOf').first
      composition_data.present? ? Composition.new(*composition_data) : nil
    end
  end
end
