# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Delivery < Model::Struct
      attribute :receiver, GOBL::Org::Party.optional

      def self.properties_ref
        @properties_ref ||= {
          'receiver' => GOBL::Org::Party
        }
      end
    end
  end
end
