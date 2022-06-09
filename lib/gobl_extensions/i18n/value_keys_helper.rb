# frozen_string_literal: true

module GOBLExtensions
  module I18n
    module ValueKeysHelper
      def method_missing(method_name, *args, &block)
        if _value.key?(method_name) || _value.key?(method_name.to_s)
          _value[method_name] || _value[method_name.to_s]
        else
          super
        end
      end

      def respond_to_missing?(method_name, *)
        _value.key?(method_name) || _value.key?(method_name.to_s) || super
      end
    end
  end
end
