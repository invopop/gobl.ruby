# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Pay
    class Terms < Model::Struct
      # Type of terms to be applied.
      attribute :code, Model::Types::String

      # Description of the conditions for payment.
      attribute :notes, (Model::Types::Hash | Model::Types::Nil).optional
    end
  end
end
