module Generators
  class Ruby
    # Base generator of a json schema of type string
    class SingleValue < Struct

      def constants
        if enum?
          <<~EOFCONST
            #{enum_const_name} = {
              #{enum_hash.map { |key, value| serialize_str(key) + ' => ' + serialize_str(value) }.join(",\n  ")}
            }
          EOFCONST
        end
      end

      def attributes
        <<~EOFATTR
          attribute :_value, #{value_type}#{type_modifiers}
          private :_value
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
        [ common_additional_methods, enum_additional_methods ]
      end

      def common_additional_methods
        <<~EOFADD
          def self.new(object)
            case object
            when Hash, self
              super
            when Symbol
              #{instantiation_from_symbol}
            else
              super _value: object.to_s
            end
          end

          def to_s
            _value.to_s
          end

          def ==(other)
            case other
            when self.class
              super
            when Symbol
              to_sym == other
            else
              to_s == other.to_s
            end
          end

          def to_sym
            to_s.parameterize.underscore.to_sym
          end
        EOFADD
      end

      def instantiation_from_symbol
        if enforce_enum?
          'new find_by_sym(object)'
        elsif enum?
          'new find_by_sym(object) || object.to_s'
        else
          'new object.to_s'
        end
      end

      def enum_additional_methods
        if enum?
          <<~EOFADD
            def self.all
              #{enum_const_name}.keys.map { |key| new(key) }
            end

            def self.find_by_sym(sym)
              all.find { |object| object.to_sym == sym }
            end

            def self.find_by_inquirer(method_name)
              method_name =~ /(.+)\\?$/ && find_by_sym($1.to_sym)
            end

            def description
              #{enum_const_name}.fetch(_value, _value)
            end

            def respond_to_missing?(method_name, include_private = false)
              self.class.find_by_inquirer(method_name) || super
            end

            def method_missing(method_name, *args, &block)
              if value = self.class.find_by_inquirer(method_name)
                self == value
              else
                super
              end
            end
          EOFADD
        end
      end

      def value_type
        raise 'Must be defined in subclasses'
      end

      def type_modifiers
        if enforce_enum?
          ".enum(*#{enum_const_name}.keys)"
        end
      end

      def enum_const_name
        'ENUM'
      end

      def enum_hash
        @enum_hash ||=
          schema.composition&.entries
            &.filter(&:const?)
            &.to_h { |e| [ e.const, e.description ] }
      end

      def enum?
        enum_hash.present?
      end

      def enforce_enum?
        enum? && schema.composition.entries.all?(&:const?)
      end
    end
  end
end
