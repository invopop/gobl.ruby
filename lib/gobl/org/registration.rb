# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Org
    # Registration is used in countries that require additional information to be associated with a company usually related to a specific registration office.
    class Registration < GOBL::Struct
      # The Schema ID of the GOBL Registration structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/registration'

      # @!attribute [r] uuid
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] office
      # @return [String]
      attribute? :office, GOBL::Types::String.optional

      # @!attribute [r] book
      # @return [String]
      attribute? :book, GOBL::Types::String.optional

      # @!attribute [r] volume
      # @return [String]
      attribute? :volume, GOBL::Types::String.optional

      # @!attribute [r] sheet
      # @return [String]
      attribute? :sheet, GOBL::Types::String.optional

      # @!attribute [r] section
      # @return [String]
      attribute? :section, GOBL::Types::String.optional

      # @!attribute [r] page
      # @return [String]
      attribute? :page, GOBL::Types::String.optional

      # @!attribute [r] entry
      # @return [String]
      attribute? :entry, GOBL::Types::String.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Registration] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          office: data['office'],
          book: data['book'],
          volume: data['volume'],
          sheet: data['sheet'],
          section: data['section'],
          page: data['page'],
          entry: data['entry']
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'office' => attributes[:office],
          'book' => attributes[:book],
          'volume' => attributes[:volume],
          'sheet' => attributes[:sheet],
          'section' => attributes[:section],
          'page' => attributes[:page],
          'entry' => attributes[:entry]
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Registration} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Registration] the object corresponding to the given input
    end
  end
end

