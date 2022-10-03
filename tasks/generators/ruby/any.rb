# frozen_string_literal: true

module Generators
  class Ruby
    # Base generator of a json schema of an unspecified type
    class Any < SingleValue
      def gobl_value_type
        'GOBL::Types::Any'
      end

      def ruby_value_type
        'Object'
      end
    end
  end
end
