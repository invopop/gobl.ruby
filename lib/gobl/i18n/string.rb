# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.28.1
##

require 'dry-struct'

module GOBL
  module I18n
    # Map of 2-Letter language codes to their translations.
    class String < Dry::Struct
      extend Forwardable
      include Enumerable

      attribute :_value, GOBL::Types::Hash

      def_delegators :_value, :[], :each, :empty?, :length, :each_key

      def self.from_gobl!(data)
        new(_value: data)
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        _value
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

