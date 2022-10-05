# frozen_string_literal: true

module GOBL
  # Base class for object structs with properties in the GOBL Schema
  class Object < Struct
    include Hashme

    # @!method self.new(attrs)
    #
    #   Returns a GOBL object from a given hash of attributes. Nested attributes are
    #   supported: the constructor will instantiate the proper GOBL objects when nested
    #   hashes or arrays are given as part of the `attrs` parameter.
    #
    #   The `new` method will only allow to create a new object if all attributes marked
    #   as mandatory and not calculated in the JSON schema are provided.
    #
    #   @param attrs [Hash] the hash of attributes
    #
    #   @return [Object] the object corresponding to the given input
  end
end
