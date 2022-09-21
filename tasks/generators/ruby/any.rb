module Generators
  class Ruby
    # Base generator of a json schema of an unspecified type
    class Any < SingleValue
      def value_type
        'GOBL::Types::Any'
      end
    end
  end
end
