# frozen_string_literal: true

require 'json'
require 'zeitwerk'
require 'active_support/core_ext/string/inflections'
require 'forwardable'
require 'net/http'
require 'base64'
require 'hashme'

loader = Zeitwerk::Loader.for_gem
loader.push_dir("#{__dir__}/generated")
loader.inflector.inflect(
  'gobl' => 'GOBL',
  'uuid' => 'UUID',
  'url' => 'URL',
  'item_id' => 'ItemID',
  'tax_id' => 'TaxID',
  'dsig' => 'DSig',
  'id' => 'ID',
  'cbc' => 'CBC',
  'iso_country_code' => 'ISOCountryCode'
)
loader.ignore("#{__dir__}/ext")
loader.setup

# Main GOBL namespace. It provides direct access to the library's configuration (see
# {Config}) and to the available operations (see {Operations}).
#
# The library also provides Ruby classes for each structure defined in the GOBL JSON
# Schema. They are available in namespaces defined under this one and named after the
# schema ID of each structure.
module GOBL
  extend GOBL::Operations

  # Returns the current configuration of the library
  #
  # @return [GOBL::Config]
  def self.config
    @config ||= Config.new
  end
end

# Extensions are all defined here so they are auto-loaded by Zeitwerk.
#
# Both the instance and class method modules need to be included/extended explicitly here
# to get YARD parsing them properly.

GOBL::I18n::String.include GOBL::Extensions::I18n::ValueKeysHelper
GOBL::Schema::Object.include GOBL::Extensions::Schema::ObjectHelper
GOBL::Schema::Object.extend GOBL::Extensions::Schema::ObjectHelper::ClassMethods
GOBL::Envelope.include GOBL::Extensions::EnvelopeHelper
GOBL::Tax::RegimeDef.extend GOBL::Extensions::Tax::RegimeHelper::ClassMethods
GOBL::Bill::Invoice.include GOBL::Extensions::Bill::InvoiceHelper
