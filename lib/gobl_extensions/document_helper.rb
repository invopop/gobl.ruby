module GOBLExtensions
  # Additional methods to help extract the contents of a "Document"
  # contained inside the envelope.
  module DocumentHelper
    def schema
      @schema ||= GOBL::ID.new(value['$schema'])
    end

    # Determine the type of document currently embedded by reading the schema
    # and attempting to instantiate the detected class.
    def extract
      raise 'unknown schema' unless schema.gobl?

      typs = ['GOBL']
      schema.modules.each do |mod|
        typs << mod.underscore.camelize
      end
      typs << schema.name.underscore.camelize
      klass = typs.join('::').constantize

      klass.from_gobl!(value.except('$schema'))
    end
  end
end
