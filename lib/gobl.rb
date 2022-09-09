# frozen_string_literal: true

require 'json'
require 'zeitwerk'
require 'dry-struct'
require 'active_support/core_ext/string/inflections'
require 'forwardable'
require 'net/http'
require 'base64'

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  'gobl' => 'GOBL',
  'gobl_extensions' => 'GOBLExtensions',
  'uuid' => 'UUID',
  'url' => 'URL',
  'item_id' => 'ItemID',
  'tax_id' => 'TaxID',
  'dsig' => 'DSig',
  'id' => 'ID'
)
loader.setup

# Main GOBL namespace which has the differents structures to generate and
# load its components. There are sub-namespaces specically defined for GOBL
# objects, based on the GOBL JSON schema.
module GOBL
  extend GOBL::Operations

  def self.config
    @config ||= Config.new
  end
end

require_relative 'extensions'
