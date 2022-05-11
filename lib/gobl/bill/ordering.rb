# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    # Ordering allows additional order details to be appended
    class Ordering < Dry::Struct
      # Party who is selling the goods and is not responsible for taxes
      attribute :seller, GOBL::Org::Party.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          seller: data['seller'] ? GOBL::Org::Party.from_gobl!(data['seller']) : nil
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'seller' => attributes[:seller]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

