# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Dsig
    class Signature < Model::Struct
      # JSON Web Signature in compact form.
      attribute :value, Model::Types::String.optional

      def self.from_gobl!(gobl)
        new(
          value: gobl
        )
      end

      def to_gobl
        value
      end
    end
  end
end
