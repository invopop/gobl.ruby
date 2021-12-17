# frozen_string_literal: true

class Generator
  module Renderer
    module Schema
      # Type
      class Type
        attr_accessor :value

        def initialize(value, ref: false)
          @value = value
          @ref = ref
        end

        def ref?
          @ref
        end

        def null?
          !ref? && value.eql?('null')
        end

        def array?
          !ref? && value.eql?('array')
        end
      end
    end
  end
end
