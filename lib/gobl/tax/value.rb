# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Value < Dynamic::Struct
      attribute :since, GOBL::Org::Date.optional
      attribute :percent, GOBL::Num::Percentage
      attribute :disabled, Dynamic::Types::Bool.optional

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
