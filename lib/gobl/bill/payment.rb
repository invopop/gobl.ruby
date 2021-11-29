# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Payment < Dynamic::Struct
      attribute :terms, GOBL::Pay::Terms.optional
      attribute :methods, Dynamic::Types::Array(GOBL::Pay::Method).optional
      attribute :payer, GOBL::Org::Party.optional

      def self.properties_ref
        @properties_ref ||= {
          'terms' => GOBL::Pay::Terms,
          'methods' => GOBL::Pay::Method,
          'payer' => GOBL::Org::Party
        }
      end
    end
  end
end
