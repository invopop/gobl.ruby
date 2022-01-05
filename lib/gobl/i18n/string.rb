# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'forwardable'

require 'dry-struct'

module GOBL
  module I18n
    class String < Dry::Struct
      extend Forwardable

      def_delegators :value, :to_s
      def_delegators :value, :[]

      # Map of 2-Letter language codes to their translations.
      attribute :value, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        new(
          value: gobl
        )
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
