# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Pay
    class BankTransfer < Model::Struct
      attribute :iban, Model::Types::String.optional
      attribute :bic, Model::Types::String.optional
      attribute :number, Model::Types::String.optional
      attribute :name, Model::Types::String.optional
      attribute :branch, GOBL::Org::Address.optional
      attribute :notes, GOBL::I18n::String.optional
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
