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

      def self.properties_ref
        @properties_ref ||= {
          'iban' => nil,
          'bic' => nil,
          'number' => nil,
          'name' => nil,
          'branch' => GOBL::Org::Address,
          'notes' => GOBL::I18n::String,
          'meta' => nil
        }
      end
    end
  end
end
