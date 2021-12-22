# frozen_string_literal: true

class Generator
  module Renderer
    class Ruby
      # FromGoblMethod - Defines the class method to convert a hash into a
      # struct.
      class FromGoblMethod
        HASH_NAME = 'gobl'

        def properties
          @properties ||= {}
        end

        def properties_ref
          @properties_ref ||= {}
        end

        def to_s
          %(
            def self.from_gobl!(#{HASH_NAME})
              #{HASH_NAME} = Model::Types::Hash[#{HASH_NAME}]

              new(
                #{properties_as_string.join("\n")}
              )
            end
          )
        end

        private

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

        def properties_as_string
          properties.map do |name, prop|
            base_fetch = "#{HASH_NAME}[#{name.inspect}]"
            ref_kls = properties_ref[name]

            "#{name}: #{fetch(prop, ref_kls, base_fetch, prop.optional?)},"
          end
        end
      end
    end
  end
end
