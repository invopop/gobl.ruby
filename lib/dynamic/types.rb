# frozen_string_literal: true

require 'dry-types'

module Dynamic
  # Types - Global set of types
  module Types
    include Dry.Types()

    Nil    = Strict::Nil
    Int    = Strict::Integer
    Bool   = Strict::Bool
    Hash   = Strict::Hash
    String = Strict::String
    Double = Strict::Float | Strict::Integer
  end
end
