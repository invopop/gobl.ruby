# frozen_string_literal: true

class Generator
  module Renderer
    class Ruby
      # FromGoblMethod - Defines the class method to convert a hash into a
      # struct.
      class FromGoblMethod
        def properties
          @properties ||= {}
        end

        def properties_as_string
          properties.keys.map do |name|
            "#{name}: gobl[#{name.inspect}],"
          end
        end

        def to_s
          %(
            def self.from_gobl!(gobl)
              gobl = Model::Types::Hash[gobl]

              new(
                #{properties_as_string.join("\n")}
              )
            end
          )
        end
      end
    end
  end
end
