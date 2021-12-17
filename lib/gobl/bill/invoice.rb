# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

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
    end
  end
end
