# frozen_string_literal: true

class Generator
  module Renderer
    class Ruby
      # ToGoblMethod - Defines the instance method to convert a struct into a
      # hash.
      class ToGoblMethod
        def initialize(properties, is_value: false)
          @properties = properties
          @is_value = is_value
        end

        def value?
          @is_value
        end

        def to_s
          %(
            def to_gobl
              #{return_object}
            end
          )
        end

        private

        attr_reader :properties

        def export(prop, kls, base_case)
          if prop.ref? && kls
            "#{base_case}&.to_gobl"
          elsif prop.array?
            "#{base_case}&.map { |x| #{export(prop.items, kls, 'x')} }"
          else
            base_case
          end
        end

        def properties_as_string
          properties.map do |name, prop|
            base_case = "attributes[:#{name}]"
            kls = prop.ref_klass

            "#{name.inspect} => #{export(prop, kls, base_case)},"
          end
        end

        def return_object
          return 'value' if value?

          %({
            #{properties_as_string.join("\n")}
          })
        end
      end
    end
  end
end
