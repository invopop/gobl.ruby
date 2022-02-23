# frozen_string_literal: true

GOBL::I18n::String.class_eval do
  include GOBLExtensions::I18n::ValueKeysHelper
end
GOBL::Document.class_eval do
  include GOBLExtensions::DocumentHelper
end
GOBL::Envelope.class_eval do
  include GOBLExtensions::EnvelopeHelper
end
GOBL::Tax::Region.class_eval do
  extend GOBLExtensions::Tax::RegionHelper # these are all class helpers
end
