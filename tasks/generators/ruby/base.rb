# frozen_string_literal: true

module Generators
  class Ruby
    class SkipFileError < StandardError; end

    # Base is used to define the basic structure and methods used in generating a ruby structure.
    class Base
      include TypeHelpers

      attr_reader :schema, :name, :modules, :parent

      def initialize(modules, name, schema, parent)
        raise SkipFileError if gobl_custom_ref_map.key?(parent.id.to_s)

        @modules = modules
        @name = name
        @schema = schema
        @parent = parent
      end

      def to_s
        content.chomp
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
        head += "## #{parent.comment}\n" if parent.present? && parent.comment.present?
        head += "##\n"
      end

      def add_modules(mods)
        if mods.length.zero?
          module_content
        else
          mods = mods.dup
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
          out += (line.blank? ? "\n" : "#{pad}#{line}\n")
        end
        out
      end

      def class_name
        @name.camelize
      end
    end
  end
end
