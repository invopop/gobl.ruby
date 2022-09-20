module Generators
  class Ruby
    # Base generator of a json schema of type string
    class SingleValue < Struct

      def constants
        if enum?
          <<~EOFCONST
            # The enumeration of values of the object and their descriptions (Values different to these are #{enforce_enum? ? "not" : "also"} allowed)
            #{enum_const_name} = {
              #{enum_hash.map { |key, value| serialize_str(key) + ' => ' + serialize_str(value) }.join(",\n  ")}
            }
          EOFCONST
        end
      end

      def attributes
        <<~EOFATTR
          attribute :_value, #{gobl_value_type}#{type_modifiers}
          private :_value
        EOFATTR
      end

      def from_gobl_method
        <<~EOFMETH
          # Creates a new object from a GOBL value
          #
          # @param data [#{ruby_value_type}] the GOBL value
          #
          # @return [#{name}] the object created from the given data
          def self.from_gobl!(data)
            new(_value: data)
          end
        EOFMETH
      end

      def to_gobl_method
        <<~EOFMETH
          # Returns a GOBL value representing the current object
          #
          # @return [#{ruby_value_type}] the GOBL value that represents the current object
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
          # Returns a {#{name}} that corresponds to a given object. The object can be a
          # `Symbol`, a `String` or anything coercible into one (via `#to_s`).
          #
          # @param object [Symbol, String, #to_s] the value of the object.
          #
          # @return [#{name}] the object corresponding to the given value.
          #
          # @example Instantiating from a symbol
          #   #{name.underscore} = #{modules.map(&:camelize).join('::')}::#{name}.new(:#{enum? ? enum_hash.keys[0].parameterize.underscore : 'value'})
          #
          # @example Instantiating from a string
          #   #{name.underscore} = #{modules.map(&:camelize).join('::')}::#{name}.new('#{enum? ? enum_hash.keys[0] : 'value'}')
          def self.new(object)
            case object
            when Hash, self # internal use, not to be used in public calls
              super
            when Symbol
              #{instantiation_from_symbol}
            else
              super _value: object.to_s
            end
          end

          # Returns the string representation of the current object
          #
          # @return [String] the string representation of the current object
          def to_s
            _value.to_s
          end

          # Returns the symbol representation of the current object
          #
          # @return [Symbol] the symbol representation of the current object
          def to_sym
            to_s.parameterize.underscore.to_sym
          end

          # Returns whether the current object is equivalent to a given one. In addition
          # to {#{name}} objects, the current object can be compared to a `Symbol`, a
          # `String` or anything coercible into one (via `#to_s`)
          #
          # @param other [#{name}, Symbol, String, #to_s] the other object to compare to
          #
          # @return [Boolean] `true` if the objects are equivalent, `false` otherwise
          #
          # @example Comparing to another {#{name}} object
          #   #{name.underscore} = #{modules.map(&:camelize).join('::')}::#{name}.new('#{enum? ? enum_hash.keys[0] : 'value'}')
          #   #{name.underscore} == #{modules.map(&:camelize).join('::')}::#{name}.new('#{enum? ? enum_hash.keys[0] : 'value'}') #=> true
          #   #{name.underscore} == #{modules.map(&:camelize).join('::')}::#{name}.new('#{enum? ? enum_hash.keys[1] : 'other'}') #=> false
          #
          # @example Comparing to a string
          #   #{name.underscore} = #{modules.map(&:camelize).join('::')}::#{name}.new('#{enum? ? enum_hash.keys[0] : 'value'}')
          #   #{name.underscore} == '#{enum? ? enum_hash.keys[0] : 'value'}' #=> true
          #   #{name.underscore} == '#{enum? ? enum_hash.keys[1] : 'other'}' #=> false
          #
          # @example Comparing to a symbol
          #   #{name.underscore} = #{modules.map(&:camelize).join('::')}::#{name}.new('#{enum? ? enum_hash.keys[0] : 'value'}')
          #   #{name.underscore} == :#{enum? ? enum_hash.keys[0].parameterize.underscore : 'value'} #=> true
          #   #{name.underscore} == :#{enum? ? enum_hash.keys[1].parameterize.underscore : 'other'} #=> false
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
            # Returns an array with all the enumerated objects of this type
            #
            # @return [Array<#{name}>] the array of enumerated objects
            def self.all
              #{enum_const_name}.keys.map { |key| new(key) }
            end

            # @api private
            def self.find_by_sym(sym)
              all.find { |object| object.to_sym == sym }
            end

            # @api private
            def self.find_by_inquirer(method_name)
              method_name =~ /(.+)\\?$/ && find_by_sym($1.to_sym)
            end

            # Returns the description of the current object
            #
            # @return [String] the description of the current object
            def description
              #{enum_const_name}.fetch(_value, _value)
            end

            # @api private
            def respond_to_missing?(method_name, include_private = false)
              self.class.find_by_inquirer(method_name) || super
            end

            # Enables dynamic value inquirers like `#{name}##{enum_hash.keys[0].parameterize.underscore}?` for
            # each of the declared enum values (see {ENUM}). Each inquirer returns a
            # `Boolean` denoting whether the value equals the enquired value (`true`) or
            # not (`false`)
            #
            # @example
            #   #{name.underscore} = #{modules.map(&:camelize).join('::')}::#{name}.new('#{enum_hash.keys[0]}')
            #   #{name.underscore}.#{enum_hash.keys[0].parameterize.underscore}? # => true
            #   #{name.underscore}.#{enum_hash.keys[1].parameterize.underscore}? # => false
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

      def gobl_value_type
        raise 'Must be defined in subclasses'
      end

      def ruby_value_type
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
