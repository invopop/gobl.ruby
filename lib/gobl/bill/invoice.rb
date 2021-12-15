# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Invoice < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :code, Model::Types::String
      attribute :type_code, Model::Types::String.optional
      attribute :currency, Model::Types::String
      attribute :rates, Model::Types::Array(GOBL::Currency::ExchangeRate).optional
      attribute :prices_include_tax, Model::Types::Bool.optional
      attribute :preceding, GOBL::Bill::Preceding.optional
      attribute :issue_date, GOBL::Org::Date
      attribute :op_date, GOBL::Org::Date.optional
      attribute :value_date, GOBL::Org::Date.optional
      attribute :supplier, GOBL::Org::Party
      attribute :customer, GOBL::Org::Party.optional
      attribute :lines, Model::Types::Array(GOBL::Bill::Line).optional
      attribute :outlays, Model::Types::Array(GOBL::Bill::Outlay).optional
      attribute :totals, GOBL::Bill::Totals
      attribute :ordering, GOBL::Bill::Ordering.optional
      attribute :payment, GOBL::Bill::Payment.optional
      attribute :delivery, GOBL::Bill::Delivery.optional
      attribute :notes, Model::Types::String.optional
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
