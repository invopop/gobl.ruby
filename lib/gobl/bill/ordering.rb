# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Ordering < Model::Struct
      attribute :seller, GOBL::Org::Party.optional

      def self.properties_ref
        @properties_ref ||= {
          'seller' => GOBL::Org::Party
        }
      end
    end
  end
end
