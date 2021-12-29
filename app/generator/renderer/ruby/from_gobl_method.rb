# frozen_string_literal: true

class Generator
  module Renderer
    class Ruby
      # FromGoblMethod - Defines the class method to convert a hash into a
      # struct.
      class FromGoblMethod
        PARAM_NAME = 'gobl'

        def initialize(class_name, properties, is_value: false)
          @class_name = class_name
          @properties = properties
          @is_value = is_value
        end

        def value?
          @is_value
        end

        def to_s
          %(
            def self.from_gobl!(#{PARAM_NAME})
              #{variable_assigment}

              new(
                #{properties_as_string.join("\n")}
              )
            end
          )
        end

        private

        attr_reader :class_name, :properties

        def ref_fetch(base_case, kls, optional)
          if optional
            "#{base_case} ? #{kls}.from_gobl!(#{base_case}) : nil"
          else
            "#{kls}.from_gobl!(#{base_case})"
          end
        end

        def fetch(prop, kls, base_case, optional)
          if prop.ref? && kls
            ref_fetch(base_case, kls, optional)
          elsif prop.array?
            "#{base_case}&.map { |x| #{fetch(prop.items, kls, 'x', false)} }"
          else
            base_case
          end
        end

        def variable_assigment
          "#{PARAM_NAME} = GOBL::Types::Hash[#{PARAM_NAME}]" unless value?
        end

        def properties_as_string
          return ["value: #{PARAM_NAME}"] if value?

          properties.map do |name, prop|
            base_fetch = "#{PARAM_NAME}[#{name.inspect}]"
            kls = prop.ref_klass

            "#{name}: #{fetch(prop, kls, base_fetch, prop.optional?)},"
          end
        end
      end
    end
  end
end
