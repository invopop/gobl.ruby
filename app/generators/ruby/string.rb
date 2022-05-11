module Generators
  class Ruby
    # Base generator of a json schema of type string
    class String < Struct
      def attributes
        <<~EOFATTR
          attribute :value, GOBL::Types::String
        EOFATTR
      end

      def from_gobl_method
        <<~EOFMETH
          def self.from_gobl!(data)
            new(value: data)
          end
        EOFMETH
      end

      def to_gobl_method
        <<~EOFMETH
          def to_gobl
            value
          end
        EOFMETH
      end

      def additional_methods
        <<~EOF
          def to_s
            value.to_s
          end
        EOF
      end
    end
  end
end
