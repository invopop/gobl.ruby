# frozen_string_literal: true

class Generator
  class Renderer
    class Ruby
      # Attribute
      class Attribute
        attr_accessor :name, :properties, :required

        def initialize(name, properties, required: true)
          @name = name
          @properties = properties
          @required = required
        end

        def optional?
          !required || null_type?
        end

        def null_type?
          types.map(&:null?).any?
        end

        def override_types(&block)
          types.each do |t|
            t.override(&block)
          end
        end

        def types
          @types ||= safe_types_lookup(
            properties['type'],
            properties['$ref']
          )
        end

        private

        def type_lookup(type, ref)
          t = if type.nil? && !ref.nil?
                Type.new(ref, is_name: false)
              else
                Type.new(type)
              end

          t.items = properties['items']
          t
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
