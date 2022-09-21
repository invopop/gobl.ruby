# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.3
##


module GOBL
  module Org
    # NoteKey identifies the type of note being edited
    class NoteKey < GOBL::Struct
      # The Schema ID of the GOBL NoteKey structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/notes#/$defs/NoteKey'

      # The enumeration of values of the object and their descriptions (Values different to these are not allowed)
      ENUM = {
        'goods' => 'Goods Description',
        'payment' => 'Terms of Payment',
        'legal' => 'Legal or regulatory information',
        'dangerous-goods' => 'Dangerous goods additional information',
        'ack' => 'Acknowledgement Description',
        'rate' => 'Rate additional information',
        'reason' => 'Reason',
        'dispute' => 'Dispute',
        'customer' => 'Customer remarks',
        'glossary' => 'Glossary',
        'customs' => 'Customs declaration information',
        'general' => 'General information',
        'handling' => 'Handling instructions',
        'packaging' => 'Packaging information',
        'loading' => 'Loading instructions',
        'price' => 'Price conditions',
        'priority' => 'Priority information',
        'regulatory' => 'Regulatory information',
        'safety' => 'Safety instructions',
        'ship-line' => 'Ship line',
        'supplier' => 'Supplier remarks',
        'transport' => 'Transportation information',
        'delivery' => 'Delivery information',
        'quarantine' => 'Quarantine information',
        'tax' => 'Tax declaration'
      }

      attribute :_value, GOBL::Types::String.enum(*ENUM.keys)
      private :_value

      # Creates a new object from a GOBL value
      #
      # @param data [String] the GOBL value
      #
      # @return [NoteKey] the object created from the given data
      def self.from_gobl!(data)
        new(_value: data)
      end

      # Returns a GOBL value representing the current object
      #
      # @return [String] the GOBL value that represents the current object
      def to_gobl
        _value
      end

      # Returns a {NoteKey} that corresponds to a given object. The object can be a
      # `Symbol`, a `String` or anything coercible into one (via `#to_s`).
      #
      # @param object [Symbol, String, #to_s] the value of the object.
      #
      # @return [NoteKey] the object corresponding to the given value.
      #
      # @example Instantiating from a symbol
      #   note_key = GOBL::Org::NoteKey.new(:goods)
      #
      # @example Instantiating from a string
      #   note_key = GOBL::Org::NoteKey.new('goods')
      def self.new(object)
        case object
        when Hash, self # internal use, not to be used in public calls
          super
        when Symbol
          new find_by_sym(object)
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
      # to {NoteKey} objects, the current object can be compared to a `Symbol`, a
      # `String` or anything coercible into one (via `#to_s`)
      #
      # @param other [NoteKey, Symbol, String, #to_s] the other object to compare to
      #
      # @return [Boolean] `true` if the objects are equivalent, `false` otherwise
      #
      # @example Comparing to another {NoteKey} object
      #   note_key = GOBL::Org::NoteKey.new('goods')
      #   note_key == GOBL::Org::NoteKey.new('goods') #=> true
      #   note_key == GOBL::Org::NoteKey.new('payment') #=> false
      #
      # @example Comparing to a string
      #   note_key = GOBL::Org::NoteKey.new('goods')
      #   note_key == 'goods' #=> true
      #   note_key == 'payment' #=> false
      #
      # @example Comparing to a symbol
      #   note_key = GOBL::Org::NoteKey.new('goods')
      #   note_key == :goods #=> true
      #   note_key == :payment #=> false
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

      # Returns an array with all the enumerated objects of this type
      #
      # @return [Array<NoteKey>] the array of enumerated objects
      def self.all
        ENUM.keys.map { |key| new(key) }
      end

      # @api private
      def self.find_by_sym(sym)
        all.find { |object| object.to_sym == sym }
      end

      # @api private
      def self.find_by_inquirer(method_name)
        method_name =~ /(.+)\?$/ && find_by_sym($1.to_sym)
      end

      # Returns the description of the current object
      #
      # @return [String] the description of the current object
      def description
        ENUM.fetch(_value, _value)
      end

      # @api private
      def respond_to_missing?(method_name, include_private = false)
        self.class.find_by_inquirer(method_name) || super
      end

      # Enables dynamic value inquirers like `NoteKey#goods?` for
      # each of the declared enum values (see {ENUM}). Each inquirer returns a
      # `Boolean` denoting whether the value equals the enquired value (`true`) or
      # not (`false`)
      #
      # @example
      #   note_key = GOBL::Org::NoteKey.new('goods')
      #   note_key.goods? # => true
      #   note_key.payment? # => false
      def method_missing(method_name, *args, &block)
        if value = self.class.find_by_inquirer(method_name)
          self == value
        else
          super
        end
      end
    end
  end
end

