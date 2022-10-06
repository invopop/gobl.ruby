# frozen_string_literal: true

module GOBLExtensions
  # Additional methods for the generated {GOBL::Envelope} class
  module EnvelopeHelper
    def self.included(klass)
      klass.alias_method :schema, '$schema'
      klass.alias_method :schema=, '$schema='
    end

    # Extracts the GOBL struct embedded in the envelope's document
    #
    # @see GOBLExtensions::DocumentHelper#extract
    #
    # @return [GOBL::Struct] the GOBL struct embedded in the envelope's document
    def extract
      doc.extract
    end
  end
end
