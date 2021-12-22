# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module UUID
    class UUID < Model::Struct
      # Universally Unique Identifier. We only recommend using versions 1 and 4 within GoBL.
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
