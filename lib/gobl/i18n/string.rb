# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module I18n
    # Map of 2-Letter language codes to their translations.
    class String < Dry::Struct
      extend Forwardable
      include Enumerable

      attribute :value, GOBL::Types::Hash

      def_delegators :value, :[], :each, :empty?

      def self.from_gobl!(data)
        new(value: data)
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        value
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

