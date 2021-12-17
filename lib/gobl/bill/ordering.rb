# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Ordering < Model::Struct
      # Party who is selling the goods and is not responsible for taxes.
      attribute :seller, GOBL::Org::Party.optional
    end
  end
end
