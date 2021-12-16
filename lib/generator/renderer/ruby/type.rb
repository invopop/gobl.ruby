# frozen_string_literal: true

class Generator
  class Renderer
    class Ruby
      # Type
      class Type
        attr_reader :obj, :items
        attr_accessor :is_name

        def initialize(obj, is_name: true)
          @obj = obj
          @is_name = is_name
        end

        def override(&block)
          if array?
            items.override_types(&block)
          elsif !is_name
            @obj = yield obj
          end
        end

        def null?
          is_name && obj.eql?('null')
        end

        def array?
          is_name && obj.eql?('array')
        end

        def items=(props)
          @items = Attribute.new('__items__', props)
        end
      end
    end
  end
end
