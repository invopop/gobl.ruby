# frozen_string_literal: true

module GOBL
  module Extensions
    # Additional methods for the generated {GOBL::Document} class
    module DocumentHelper
      # Returns the Schema ID of the current document
      #
      # @return [GOBL::ID] the Schema ID
      def schema
        @schema ||= GOBL::ID.new(_map['$schema'])
      end

      # Extracts the GOBL struct embedded in the document. It determines the type of document
      # currently embedded by reading the schema and attemps to instantiate the detected
      # class.
      #
      # @return [GOBL::Struct] the GOBL struct embedded in the document
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

        klass.new _map.except('$schema')
      end

      module ClassMethods
        # Embeds the given GOBL struct in a new document injecting the proper Schema ID.
        #
        # @return [Document] the document embedding the given struct
        def embed(struct)
          new struct.as_json.merge(
            '$schema' => struct.class::SCHEMA_ID
          )
        end
      end
    end
  end
end
