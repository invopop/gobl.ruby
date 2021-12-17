# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Pay
    class Method < Model::Struct
      # Code for the method type that can be used.
      attribute :code, Model::Types::String

      # Details on how to pay using a bank transfer or wire.
      attribute :bank_transfer, GOBL::Pay::BankTransfer.optional

      # Web address that can be used for making the payment. Likely to be custom for each document.
      attribute :url, GOBL::Pay::URL.optional

      # Additional details related to this payment method.
      attribute :notes, Model::Types::String.optional

      # Additional non-structure data.
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
