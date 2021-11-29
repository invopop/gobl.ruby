# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Pay
    class Terms < Dynamic::Struct
      attribute :code, Dynamic::Types::String
      attribute :notes, GOBL::I18n::String.optional

      def self.properties_ref
        @properties_ref ||= {
          'code' => nil,
          'notes' => GOBL::I18n::String
        }
      end
    end
  end
end
