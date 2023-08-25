# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.54.0
##

module GOBL
  module Org
    # Image describes a logo or photo that represents an entity.
    class Image < GOBL::Object
      # The Schema ID of the GOBL Image structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/image'

      # @!attribute [r] uuid
      # Unique ID of the image
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] label
      # Label to help identify the image.
      # @return [String]
      property :label, String

      # @!attribute [r] url
      # URL of the image
      # @return [String]
      property :url, String

      # @!attribute [r] data
      # As an alternative to the URL and only when the source data is small, like an SVG, the raw data may be provided using Base64 encoding.
      # @return [String]
      property :data, String

      # @!attribute [r] mime
      # Format of the image.
      # @return [String]
      property :mime, String

      # @!attribute [r] description
      # Details of what the image represents.
      # @return [String]
      property :description, String

      # @!attribute [r] alt
      # Alternative text if the image cannot be shown.
      # @return [String]
      property :alt, String

      # @!attribute [r] height
      # Height of the image in pixels.
      # @return [Integer]
      property :height, Integer

      # @!attribute [r] width
      # Width of the image in pixels.
      # @return [Integer]
      property :width, Integer

      # @!attribute [r] digest
      # Digest can be used to ensure the image contained at the URL is the same one as originally intended.
      # @return [GOBL::DSig::Digest]
      property :digest, GOBL::DSig::Digest
    end
  end
end
