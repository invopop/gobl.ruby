# frozen_string_literal: true

module Generators
  class Ruby
    # Base generator of a json schema of type object without
    # fixed properties, i.e. a hash. This is only currently meant for very simple maps
    # of keys to primitive types.
    class Map < Struct
      def module_content
        out = ''
        out += "# #{schema.description}\n" if schema.description.present?
        out += <<~EOFMOD
          class #{class_name} < GOBL::Map
          end
        EOFMOD
        out
      end
    end
  end
end
