# frozen_string_literal: true

module Generators
  class Markdown
    class SkipFileError < StandardError
    end

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
        ""
      end

      # Override this method
      def module_content
        ""
      end

      def header
        head = <<~EOFHEAD
        ---
        title: #{class_name}
        comment: #{parent.comment if parent.present? && parent.comment.present?}
        ---
        EOFHEAD
      end

      def class_name
        @name.camelize
      end
    end
  end
end
