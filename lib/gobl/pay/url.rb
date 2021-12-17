# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Pay
    class URL < Model::Struct
      attribute :uuid, Model::Types::String.optional

      # Full URL to be used for payment.
      attribute :addr, Model::Types::String

      # Additional details which may be useful to the end-user.
      attribute :notes, Model::Types::String.optional

      # Semi-structured additional data.
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
