# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Payment < Model::Struct
      attribute :terms, GOBL::Pay::Terms.optional
      attribute :methods, Model::Types::Array(GOBL::Pay::Method).optional
      attribute :payer, GOBL::Org::Party.optional
    end
  end
end
