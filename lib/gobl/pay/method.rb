# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Pay
    class Method < Model::Struct
      attribute :code, Model::Types::String
      attribute :bank_transfer, GOBL::Pay::BankTransfer.optional
      attribute :url, GOBL::Pay::URL.optional
      attribute :notes, Model::Types::String.optional
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
