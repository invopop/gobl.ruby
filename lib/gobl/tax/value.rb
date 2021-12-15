# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Value < Model::Struct
      attribute :since, GOBL::Org::Date.optional
      attribute :percent, GOBL::Num::Percentage
      attribute :disabled, Model::Types::Bool.optional

      def self.properties_ref
        @properties_ref ||= {
          'since' => GOBL::Org::Date,
          'percent' => GOBL::Num::Percentage,
          'disabled' => nil
        }
      end
    end
  end
end
