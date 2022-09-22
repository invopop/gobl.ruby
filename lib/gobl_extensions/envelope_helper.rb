module GOBLExtensions
  # Additional methods for the generated {GOBL::Envelope} class
  module EnvelopeHelper
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
