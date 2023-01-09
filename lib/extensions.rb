# frozen_string_literal: true

# Extensions are all defined here so they are auto-loaded by Zeitwerk.
#
# Both the instance and class method modules need to be included/extended explicitly here
# to get YARD parsing them properly.

GOBL::I18n::String.include GOBLExtensions::I18n::ValueKeysHelper
GOBL::Document.include GOBLExtensions::DocumentHelper
GOBL::Document.extend GOBLExtensions::DocumentHelper::ClassMethods
GOBL::Envelope.include GOBLExtensions::EnvelopeHelper
GOBL::Tax::Regime.extend GOBLExtensions::Tax::RegimeHelper::ClassMethods
