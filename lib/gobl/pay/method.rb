# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Pay
    class Method < Dynamic::Struct
      attribute :code, Dynamic::Types::String
      attribute :bank_transfer, GOBL::Pay::BankTransfer.optional
      attribute :url, GOBL::Pay::URL.optional
      attribute :notes, Dynamic::Types::String.optional
      attribute :meta, Dynamic::Types::Hash.optional

      def self.properties_ref
        @properties_ref ||= {
          'code' => nil,
          'bank_transfer' => GOBL::Pay::BankTransfer,
          'url' => GOBL::Pay::URL,
          'notes' => nil,
          'meta' => nil
        }
      end
    end
  end
end
