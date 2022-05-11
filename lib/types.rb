module GOBL
  # Types used by the generated GOBL code.
  module Types
    include Dry.Types()

    Nil     = Strict::Nil
    Int     = Strict::Integer # depricated, use Integer
    Integer = Strict::Integer
    Bool    = Strict::Bool
    Hash    = Strict::Hash
    String  = Strict::String
    Double  = Strict::Float | Strict::Integer
  end
end
