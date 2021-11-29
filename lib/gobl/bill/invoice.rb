# frozen_string_literal: true

module GOBL
  module Bill
    class Invoice < Dynamic::Base
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :code, Dynamic::Types::String
      attribute :type_code, Dynamic::Types::String.optional
      attribute :currency, Dynamic::Types::String
      attribute :rates, Dynamic::Types::Array(GOBL::Currency::ExchangeRate).optional
      attribute :prices_include_tax, Dynamic::Types::Bool.optional
      attribute :preceding, GOBL::Bill::Preceding.optional
      attribute :issue_date, GOBL::Org::Date
      attribute :op_date, GOBL::Org::Date.optional
      attribute :value_date, GOBL::Org::Date.optional
      attribute :supplier, GOBL::Org::Party
      attribute :customer, GOBL::Org::Party.optional
      attribute :lines, Dynamic::Types::Array(GOBL::Bill::Line).optional
      attribute :outlays, Dynamic::Types::Array(GOBL::Bill::Outlay).optional
      attribute :totals, GOBL::Bill::Totals
      attribute :ordering, GOBL::Bill::Ordering.optional
      attribute :payment, GOBL::Bill::Payment.optional
      attribute :delivery, GOBL::Bill::Delivery.optional
      attribute :notes, Dynamic::Types::String.optional
      attribute :meta, Dynamic::Types::Hash.optional

      def self.refs
        @refs ||= {
          'uuid' => GOBL::UUID::UUID,
          'code' => nil,
          'type_code' => nil,
          'currency' => nil,
          'rates' => GOBL::Currency::ExchangeRate,
          'prices_include_tax' => nil,
          'preceding' => GOBL::Bill::Preceding,
          'issue_date' => GOBL::Org::Date,
          'op_date' => GOBL::Org::Date,
          'value_date' => GOBL::Org::Date,
          'supplier' => GOBL::Org::Party,
          'customer' => GOBL::Org::Party,
          'lines' => GOBL::Bill::Line,
          'outlays' => GOBL::Bill::Outlay,
          'totals' => GOBL::Bill::Totals,
          'ordering' => GOBL::Bill::Ordering,
          'payment' => GOBL::Bill::Payment,
          'delivery' => GOBL::Bill::Delivery,
          'notes' => nil,
          'meta' => nil
        }
      end
    end
  end
end
