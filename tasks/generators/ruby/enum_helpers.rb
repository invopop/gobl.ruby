# frozen_string_literal: true

module Generators
  class Ruby
    module EnumHelpers
      def render_enum(enum, const_name = 'ENUM')
        <<~EOF
          #{const_name} = {
            #{enum.map { |key, value| "#{serialize_str(key)} => #{serialize_str(value)}" }.join(",\n  ")}
          }.freeze
        EOF
      end
    end
  end
end
