# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Rate < Dynamic::Struct
      attribute :cat, Dynamic::Types::String
      attribute :code, Dynamic::Types::String

      def self.properties_ref
        @properties_ref ||= {
          'cat' => nil,
          'code' => nil
        }
      end
    end
  end
end
