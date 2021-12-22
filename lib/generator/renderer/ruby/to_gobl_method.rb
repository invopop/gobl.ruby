# frozen_string_literal: true

class Generator
  module Renderer
    class Ruby
      # ToGoblMethod - Defines the instance method to convert a struct into a
      # hash.
      class ToGoblMethod
        def properties
          @properties ||= {}
        end

        def to_s
          %(
            def to_gobl
              {
                #{properties_as_string.join("\n")}
              }
            end
          )
        end

        private

        def properties_as_string
          properties.keys.map do |name|
            "#{name.inspect} => attributes[:#{name}],"
          end
        end
      end
    end
  end
end
