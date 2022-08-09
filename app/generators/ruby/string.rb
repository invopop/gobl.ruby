module Generators
  class Ruby
    # Base generator of a json schema of type string
    class String < SingleValueStruct
      def value_type
        'GOBL::Types::String'
      end
    end
  end
end
