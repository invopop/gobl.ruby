# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module I18n
    # Map of 2-Letter language codes to their translations.
    class String < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/i18n/string'

      extend Forwardable
      include Enumerable

      attribute :_value, GOBL::Types::Hash

      def_delegators :_value, :[], :each, :empty?, :length, :each_key

      def self.from_gobl!(data)
        new(_value: data)
      end

      def to_gobl
        _value
      end
    end
  end
end

