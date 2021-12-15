# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Preceding < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :code, Model::Types::String
      attribute :issue_date, GOBL::Org::Date
      attribute :meta, Model::Types::Hash.optional

      def self.properties_ref
        @properties_ref ||= {
          'uuid' => GOBL::UUID::UUID,
          'code' => nil,
          'issue_date' => GOBL::Org::Date,
          'meta' => nil
        }
      end
    end
  end
end
