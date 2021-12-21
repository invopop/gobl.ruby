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

        def properties_ref
          @properties_ref ||= {}
        end

        def properties_as_string
          properties.map do |name, prop|
            base_fetch = "gobl[#{name.inspect}]"
            ref_kls = properties_ref[name]

            "#{name}: #{getter(prop, ref_kls, base_fetch, prop.optional?)},"
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

        private

        def ref_getter(fetch, kls, optional)
          if optional
            "#{fetch} ? #{kls}.from_gobl!(#{fetch}) : nil"
          else
            "#{kls}.from_gobl!(#{fetch})"
          end
        end

        def getter(prop, kls, fetch, optional)
          if prop.ref? && kls
            ref_getter(fetch, kls, optional)
          elsif prop.array?
            "#{fetch}&.map { |x| #{getter(prop.items, kls, 'x', false)} }"
          else
            fetch
          end
        end
      end
    end
  end
end
