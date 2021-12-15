# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Rate < Model::Struct
      attribute :cat, Model::Types::String
      attribute :code, Model::Types::String

      def self.properties_ref
        @properties_ref ||= {
          'cat' => nil,
          'code' => nil
        }
      end
    end
  end
end
