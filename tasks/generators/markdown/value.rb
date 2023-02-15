# frozen_string_literal: true

module Generators
  class Markdown
    # Base generator of a json schema of type nil or string
    class Value < Struct

      def additional_content
        enum_constant
      end

      def enum_constant
        return unless enum?

        table = Terminal::Table.new
        table.headings = %w[Value Description]
        table.style = { border: :markdown }
        table.rows = enum_hash.map do |key, value|
          [key.blank? ? "": "`#{key}`", value]
        end
        table.to_s

        <<~EOFCONST
          ## Values

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
