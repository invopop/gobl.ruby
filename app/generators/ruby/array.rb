module Generators
  class Ruby
    # Base generator of a json schema of type array
    class Array < Struct
      def includes
        <<~EOFINC
          extend Forwardable
          include Enumerable
        EOFINC
      end

      def attributes
        <<~EOFATTR
          attribute :ary, #{gobl_type_string(schema)}

          def_delegators :ary, :[], :each, :empty?, :length
        EOFATTR
      end

      def from_gobl_method
        <<~EOFMETH
          def self.from_gobl!(data)
            new(ary: #{from_gobl_method_map_or_instance} )
          end
        EOFMETH
      end

      def from_gobl_method_map_or_instance
        klass = gobl_type_string(schema.items)
        if schema.items.ref.present?
          "data&.map { |item| #{klass}.from_gobl!(item) }"
        else
          'data'
        end
      end

      def to_gobl_method
        <<~EOFMETH
          def to_gobl
            ary
          end
        EOFMETH
      end
    end
  end
end
