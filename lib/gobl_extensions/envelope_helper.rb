module GOBLExtensions
  module EnvelopeHelper
    # Provide the GOBL Envelope's schema, which will also contain version information.
    def schema
      @schema ||= GOBL::ID.new(value['$schema'])
    end

    def extract
      doc.extract
    end
  end
end
