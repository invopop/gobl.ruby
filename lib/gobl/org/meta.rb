# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Meta defines a structure for data about the data being defined.
    class Meta < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/org/meta'

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

