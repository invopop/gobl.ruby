# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Cal
    # Period represents two dates with a start and finish.
    class Period < GOBL::Struct
      # The Schema ID of the GOBL Period structure
      SCHEMA_ID = 'https://gobl.org/draft-0/cal/period'

      # @!attribute [r] start
      # @return [GOBL::Cal::Date]
      attribute :start, GOBL::Cal::Date

      # @!attribute [r] end
      # @return [GOBL::Cal::Date]
      attribute :end, GOBL::Cal::Date

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Period] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          start: GOBL::Cal::Date.from_gobl!(data['start']),
          end: GOBL::Cal::Date.from_gobl!(data['end'])
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'start' => attributes[:start]&.to_gobl,
          'end' => attributes[:end]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Period} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   The `new` method will only allow to create a new object if all attributes
      #   marked as mandatory and not calculated in the JSON schema are provided.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Period] the object corresponding to the given input
    end
  end
end

