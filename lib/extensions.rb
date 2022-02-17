# frozen_string_literal: true

GOBL::I18n::String.class_eval do
  include GOBLExtensions::I18n::ValueKeysHelper
end

GOBL::Envelope.extend(GOBLExtensions::DocumentHelper)
