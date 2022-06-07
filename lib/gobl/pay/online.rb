# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.23.0
##

require 'dry-struct'

module GOBL
  module Pay
    # Online provides the details required to make a payment online using a website
    class Online < Dry::Struct
      # Descriptive name given to the online provider.
      attribute :name, GOBL::Types::String.optional

      # Full URL to be used for payment.
      attribute :addr, GOBL::Types::String

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          name: data['name'],
          addr: data['addr']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'name' => attributes[:name],
          'addr' => attributes[:addr]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

