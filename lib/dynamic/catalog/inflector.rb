# frozen_string_literal: true

module Dynamic
  class Catalog
    # Inflector - Path and object naming helper
    class Inflector
      def inflect(inflections)
        overrides.merge!(inflections)
      end

      def path_name(raw_name)
        (
          overrides.invert[raw_name] ||
          raw_name.gsub(/(.)([A-Z])/, '\1_\2').downcase
        )
      end

      def camel_case_segments(text, sep = '.')
        text.split(sep).map do |w|
          overrides[w] || [w[0].upcase, w[1..]].join
        end
      end

      private

      def overrides
        @overrides ||= {}
      end
    end
  end
end
