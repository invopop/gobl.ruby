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
        enum_option = <<~EOFOPT
          when Symbol
            super _value: ENUM.keys.find { |key| to_sym(key) == object }
        EOFOPT

        <<~EOFADD
          def to_s
            _value.to_s
          end

          def self.to_sym(object)
            object.to_s.underscore.to_sym
          end

          def to_sym
            self.class.to_sym(self)
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
            when String #FIXME: type might not be String
              super _value: object
            #{enum_option if enum?}
            else
              if object.respond_to?(:to_s)
                super _value: object.to_s
              end
            end
          end
        EOFADD
      end

      def enum_additional_methods
        if enum?
          <<~EOFADD
            def description
              #{enum_const_name}.fetch(_value, _value)
            end

            INQUIRERS = #{enum_const_name}.keys.map { |key| [ \"\#{key.underscore}?\".to_sym, key ] }.to_h

            def respond_to_missing?(method_name, include_private = false)
              INQUIRERS.has_key?(method_name) || super
            end

            def method_missing(method_name, *args, &block)
              if INQUIRERS.has_key?(method_name)
                _value == INQUIRERS[method_name]
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
