# frozen_string_literal: true

require 'json'
require 'zeitwerk'
require 'active_support/core_ext/string/inflections'
require 'forwardable'
require 'net/http'
require 'base64'
require 'hashme'

require_relative 'ext/hashme'

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  'gobl' => 'GOBL',
  'gobl_extensions' => 'GOBLExtensions',
  'uuid' => 'UUID',
  'url' => 'URL',
  'item_id' => 'ItemID',
  'tax_id' => 'TaxID',
  'dsig' => 'DSig',
  'id' => 'ID',
  'cbc' => 'CBC'
)
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

require_relative 'extensions'
