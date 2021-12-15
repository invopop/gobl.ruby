# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  class Stamp < Model::Struct
    attribute :prv, Model::Types::String
    attribute :val, Model::Types::String

    def self.properties_ref
      @properties_ref ||= {
        'prv' => nil,
        'val' => nil
      }
    end
  end
end
