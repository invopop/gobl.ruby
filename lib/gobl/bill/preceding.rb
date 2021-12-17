# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Preceding < Model::Struct
      # Preceding document's UUID if available can be useful for tracing.
      attribute :uuid, Model::Types::String.optional

      # Identity code of the previous invoice.
      attribute :code, Model::Types::String

      # When the preceding invoices was issued.
      attribute :issue_date, Model::Types::String

      # Additional semi-structured data that may be useful in specific regions.
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
