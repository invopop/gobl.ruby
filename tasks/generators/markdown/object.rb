# frozen_string_literal: true

module Generators
  class Markdown
    # Base generator of a json schema of type object
    class Object < Struct
      protected

      def additional_content
        table = Terminal::Table.new
        table.headings = %w[Property Type Req. Description]
        table.style = { border: :markdown }
        table.rows = attributes
        table.to_s

        <<~EOFMOD
        ## Properties

        #{table.to_s}
        EOFMOD
      end

      def attributes
        schema.properties.map { |name, property| attribute(name, property) }
      end

      def attribute(name, property)
        [
          "`#{name}`",
          type_string(property),
          !schema.optional?(name) ? 'true' : '',
          property.description&.split&.join(" "),
        ]
      end
    end
  end
end
