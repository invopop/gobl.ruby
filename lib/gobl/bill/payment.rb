# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Payment < Model::Struct
      # Payment terms or conditions.
      attribute :terms, GOBL::Pay::Terms.optional

      # Array of payment options that can be used to pay for this invoice.
      attribute :methods, Model::Types::Array(GOBL::Pay::Method).optional

      # The party responsible for paying for the invoice
      attribute :payer, GOBL::Org::Party.optional
    end
  end
end
