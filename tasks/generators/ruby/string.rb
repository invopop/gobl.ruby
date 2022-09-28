# frozen_string_literal: true

module Generators
  class Ruby
    # Base generator of a json schema of type string
    class String < SingleValue
      def gobl_value_type
        'GOBL::Types::String'
      end

      def ruby_value_type
        'String'
      end
    end
  end
end
