# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Bill
    class Invoice < Model::Struct
      # Unique document ID. Not required
      attribute :uuid, Model::Types::String.optional

      # Sequential code used to identify this invoice in tax declarations.
      attribute :code, Model::Types::String

      # Functional type of the invoice
      attribute :type_code, Model::Types::String.optional

      # Currency for all invoice totals.
      attribute :currency, Model::Types::String

      # Exchange rates to be used when converting the invoices monetary values into other currencies.
      attribute :rates, Model::Types::Array(GOBL::Currency::ExchangeRate).optional

      # When true
      attribute :prices_include_tax, Model::Types::Bool.optional

      # Key information regarding a previous invoice.
      attribute :preceding, GOBL::Bill::Preceding.optional

      # When the invoice was created.
      attribute :issue_date, Model::Types::String

      # Date when the operation defined by the invoice became effective.
      attribute :op_date, Model::Types::String.optional

      # When the taxes of this invoice become accountable
      attribute :value_date, Model::Types::String.optional

      # The taxable entity supplying the goods or services.
      attribute :supplier, GOBL::Org::Party

      # Legal entity who receives the goods or services. May be empty in certain circumstances such as simplified invoices.
      attribute :customer, GOBL::Org::Party.optional

      # The items sold to the customer.
      attribute :lines, Model::Types::Array(GOBL::Bill::Line).optional

      # Expenses paid for by the supplier but invoiced directly to the customer.
      attribute :outlays, Model::Types::Array(GOBL::Bill::Outlay).optional

      attribute :totals, GOBL::Bill::Totals

      attribute :ordering, GOBL::Bill::Ordering.optional

      attribute :payment, GOBL::Bill::Payment.optional

      attribute :delivery, GOBL::Bill::Delivery.optional

      # Unstructured information that is relevant to the invoice
      attribute :notes, Model::Types::String.optional

      # Additional semi-structured data that doesn't fit into the body of the invoice.
      attribute :meta, Model::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
          code: gobl['code'],
          type_code: gobl['type_code'],
          currency: gobl['currency'],
          rates: gobl['rates'],
          prices_include_tax: gobl['prices_include_tax'],
          preceding: gobl['preceding'],
          issue_date: gobl['issue_date'],
          op_date: gobl['op_date'],
          value_date: gobl['value_date'],
          supplier: gobl['supplier'],
          customer: gobl['customer'],
          lines: gobl['lines'],
          outlays: gobl['outlays'],
          totals: gobl['totals'],
          ordering: gobl['ordering'],
          payment: gobl['payment'],
          delivery: gobl['delivery'],
          notes: gobl['notes'],
          meta: gobl['meta']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid],
          'code' => attributes[:code],
          'type_code' => attributes[:type_code],
          'currency' => attributes[:currency],
          'rates' => attributes[:rates],
          'prices_include_tax' => attributes[:prices_include_tax],
          'preceding' => attributes[:preceding],
          'issue_date' => attributes[:issue_date],
          'op_date' => attributes[:op_date],
          'value_date' => attributes[:value_date],
          'supplier' => attributes[:supplier],
          'customer' => attributes[:customer],
          'lines' => attributes[:lines],
          'outlays' => attributes[:outlays],
          'totals' => attributes[:totals],
          'ordering' => attributes[:ordering],
          'payment' => attributes[:payment],
          'delivery' => attributes[:delivery],
          'notes' => attributes[:notes],
          'meta' => attributes[:meta]
        }
      end
    end
  end
end
