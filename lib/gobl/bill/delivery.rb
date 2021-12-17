# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Delivery < Model::Struct
      # The party who will receive delivery of the goods defined in the invoice and is not responsible for taxes.
      attribute :receiver, GOBL::Org::Party.optional
    end
  end
end
