# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Pay
    # Online provides the details required to make a payment online using a website
    class Online < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions#/$defs/Online'

      # @!attribute [r] name
      # Descriptive name given to the online provider.
      # @return [String]
      attribute? :name, GOBL::Types::String.optional

      # @!attribute [r] addr
      # Full URL to be used for payment.
      # @return [String]
      attribute :addr, GOBL::Types::String

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          name: data['name'],
          addr: data['addr']
        )
      end

      def to_gobl
        {
          'name' => attributes[:name],
          'addr' => attributes[:addr]
        }.compact
      end
    end
  end
end

