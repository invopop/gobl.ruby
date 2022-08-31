module Generators
  class Ruby
    # Base generator of a json schema of type string
    class SingleValueStruct < Struct

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
        symbol_case = <<~EOFOPT if enum?
          when Symbol
            super _value: lookup_enum_key_from_sym(object)
        EOFOPT

        string_case =  <<~EOFOPT if value_is_string?
          when String
            super _value: object
        EOFOPT

        else_case = value_is_string? ? <<~EOFOPT : 'super'
          if object.respond_to?(:to_s)
            super _value: object.to_s
          else
            super
          end
        EOFOPT

        <<~EOFADD
          def to_s
            _value.to_s
          end

          def ==(other)
            case other
            when self.class
              super
            when String
              to_s == other
            when Symbol
              to_sym == other
            else
              if other.respond_to?(:to_s)
                self == other.to_s
              else
                super
              end
            end
          end

          def self.new(object)
            case object
            when Hash, self
              super
            #{string_case}
            #{symbol_case}
            else
              #{else_case}
            end
          end
        EOFADD
      end

      def enum_additional_methods
        if enum?
          <<~EOFADD
            def to_sym
              self.class.enum_key_to_sym(to_s)
            end

            def self.lookup_enum_key_from_sym(sym)
              ENUM.keys.find { |key| enum_key_to_sym(key) == sym }
            end

            def self.enum_key_to_sym(object)
              object.underscore.to_sym
            end

            def description
              #{enum_const_name}.fetch(_value, _value)
            end

            def respond_to_missing?(method_name, include_private = false)
              inquired_key(method_name).present? || super
            end

            def method_missing(method_name, *args, &block)
              if value = inquired_key(method_name)
                _value == value
              else
                super
              end
            end

            def inquired_key(method_name)
              method_name =~ /(.+)\\?$/ && self.class.lookup_enum_key_from_sym($1.to_sym)
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

      def value_is_string?
        false
      end
    end
  end
end
