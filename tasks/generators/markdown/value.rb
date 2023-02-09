# frozen_string_literal: true

module Generators
  class Markdown
    # Base generator of a json schema of type nil or string
    class Value < Struct
      def parent_class
        enum? ? "GOBL::Enum" : "GOBL::Value"
      end

      def additional_content
        enum_constant
      end

      def enum_constant
        return unless enum?

        table = Terminal::Table.new
        table.headings = %w[Value Description]
        table.style = { border: :markdown }
        table.rows = enum_hash.map { |key, value| ["`#{key}`", value] }
        table.to_s

        <<~EOFCONST
          ## Values
          The enumeration of values of the object and their descriptions (Values different to these are #{strict_enum? ? "not" : "also"} allowed)

          #{table.to_s}
        EOFCONST
      end

      def enum_hash
        @enum_hash ||=
          schema
            .composition
            &.entries
            &.filter(&:const?)
            &.to_h { |e| [e.const, e.description] }
      end

      def enum?
        enum_hash.present?
      end

      def strict_enum?
        enum? && schema.composition.entries.all?(&:const?)
      end
    end
  end
end
