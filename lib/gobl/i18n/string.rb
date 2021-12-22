# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module I18n
    class String < Model::Struct
      # Map of 2-Letter language codes to their translations.
      attribute :value, (Model::Types::Hash | Model::Types::Nil)

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
