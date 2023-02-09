# frozen_string_literal: true

module Generators
  class Markdown
    # Base generator of a json schema of type object without
    # fixed properties, i.e. a hash. This is only currently meant for very simple maps
    # of keys to primitive types.
    class Map < Struct
      def module_content
        <<~EOFMOD
          #{"#{schema.description}\n" if schema.description.present?}
        EOFMOD
      end
    end
  end
end
