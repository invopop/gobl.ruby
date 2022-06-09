module Generators
  class Ruby
    # Base generator of a json schema of type object without
    # fixed properties, i.e. a hash. This is only currently meant for very simple maps
    # of keys to primitive types.
    class Map < Struct
      def includes
        <<~EOFINC
          extend Forwardable
          include Enumerable
        EOFINC
      end

      def attributes
        <<~EOFATTR
          attribute :_value, #{gobl_type_string(schema)}

          def_delegators :_value, :[], :each, :empty?, :length, :each_key
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
    end
  end
end
