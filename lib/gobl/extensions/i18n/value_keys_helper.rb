# frozen_string_literal: true

module GOBL
  module Extensions
    module I18n
      # Additional methods for the generated {GOBL::I18n::String} class
      module ValueKeysHelper
        # Enables dynamic getter methods for the mapped keys.
        #
        # @example
        #   str = GOBL::I18n::String.new(en: 'Name', es: 'Nombre')
        #   str.en #=> "Name"
        #   str.es #=> "Nombre"
        def method_missing(method_name, *args, &block)
          if _map.key?(method_name) || _map.key?(method_name.to_s)
            _map[method_name] || _map[method_name.to_s]
          else
            super
          end
        end

        # @api private
        def respond_to_missing?(method_name, *)
          _map.key?(method_name) || _map.key?(method_name.to_s) || super
        end
      end
    end
  end
end
