# frozen_string_literal: true

module GOBL
  module Extensions
    module I18n
      module ValueKeysHelper
        def method_missing(method_name, *args, &block)
          if value.key?(method_name) || value.key?(method_name.to_s)
            value[method_name] || value[method_name.to_s]
          else
            super
          end
        end

        def respond_to_missing?(method_name, *)
          value.key?(method_name) || value.key?(method_name.to_s) || super
        end
      end
    end
  end
end
