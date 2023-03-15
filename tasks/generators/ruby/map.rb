# frozen_string_literal: true

module Generators
  class Ruby
    # Base generator of a json schema of type object without
    # fixed properties, i.e. a hash. This is only currently meant for very simple maps
    # of keys to primitive types.
    class Map < Struct
      def parent_class
        'GOBL::Map'
      end

      def class_content
      end
    end
  end
end
