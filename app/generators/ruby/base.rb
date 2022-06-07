module Generators
  class Ruby
    # Base is used to define the basic structure and methods used in generating a ruby structure.
    class Base
      include TypeHelpers

      attr_reader :schema, :name, :modules, :parent

      def initialize(modules, name, schema, parent)
        @modules = modules
        @name = name
        @schema = schema
        @parent = parent
      end

      def to_s
        content
      end

      protected

      # Override this method
      def content
        ''
      end

      # Override this method
      def module_content
        ''
      end

      def header
        head = <<~EOFHEAD
          # frozen_string_literal: true

          ##
          ## DO NOT EDIT - This file was generated automatically.
          ##
        EOFHEAD
        if parent.present? && parent.comment.present?
          head << "## #{parent.comment}\n##\n"
        end
        head
      end

      def add_modules(mods)
        if mods.length.zero?
          module_content
        else
          mod = mods.shift
          <<~EOFMOD
            module #{mod.camelize}
            #{indent(add_modules(mods), 1).chomp}
            end
          EOFMOD
        end
      end

      def indent(str, indent = 0)
        return '' if str.blank?

        out = ''
        pad = '  ' * indent
        str.split("\n").each do |line|
          out << (line.blank? ? "\n" : "#{pad}#{line}\n")
        end
        out
      end

      def class_name
        @name.camelize
      end
    end
  end
end
