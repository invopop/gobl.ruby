# frozen_string_literal: true

class Generator
  module Renderer
    module Schema
      # Property
      class Property
        def initialize(schema, required: true)
          @schema = schema
          @required = required
        end

        def null?
          types.map(&:null?).any?
        end

        def required?
          @required
        end

        def optional?
          !@required
        end

        def override(&block)
          types.each do |type|
            if type.array?
              items.override(&block)
            elsif type.ref?
              type.value = yield type.value
            end
          end
        end

        def types
          @types ||= safe_types_lookup(schema['type'], schema['$ref'])
        end

        def items
          @items ||= Property.new(schema['items'])
        end

        def description
          @description ||= schema['description']
        end

        private

        attr_reader :schema

        def type_lookup(type, ref)
          predicate = type.nil? && !ref.nil?

          Type.new(predicate ? ref : type, ref: predicate)
        end

        def safe_types_lookup(type, ref)
          if type.is_a?(Array)
            type.map { |t| type_lookup(t, ref) }
          else
            [type_lookup(type, ref)]
          end
        end
      end
    end
  end
end
