module GOBLExtensions
  # Additional methods to help extract the contents of a "Document"
  # contained inside the envelope.
  module DocumentHelper
    def self.included(klass)
      klass.extend ClassMethods
    end

    def schema
      @schema ||= GOBL::ID.new(_value['$schema'])
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

      # Sanity check
      raise "#{klass.name}::SCHEMA_ID expected to be '#{schema}'" unless schema == klass::SCHEMA_ID

      klass.from_gobl!(_value.except('$schema'))
    end

    module ClassMethods
      # Embed the given struct in a new document injecting the proper $schema key.
      def embed(struct)
        from_gobl! struct.to_gobl.merge(
          '$schema' => struct.class::SCHEMA_ID
        )
      end
    end
  end
end
