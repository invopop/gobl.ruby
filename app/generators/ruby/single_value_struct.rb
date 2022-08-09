module Generators
  class Ruby
    # Base generator of a json schema of type string
    class SingleValueStruct < Struct

      def attributes
        <<~EOFATTR
          attribute :_value, #{value_type}
        EOFATTR
      end

      def from_gobl_method
        <<~EOFMETH
          def self.from_gobl!(data)
            new(_value: data)
          end
        EOFMETH
      end

      def to_gobl_method
        <<~EOFMETH
          def to_gobl
            _value
          end
        EOFMETH
      end

      def additional_methods
        <<~EOF
          def to_s
            _value.to_s
          end
        EOF
      end

      def value_type
        raise 'Must be defined in subclasses'
      end
    end
  end
end
