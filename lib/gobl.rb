# frozen_string_literal: true

require 'json'
require 'zeitwerk'
require 'dry-struct'
require 'active_support/core_ext/string/inflections'
require 'active_support/concern'
require 'forwardable'
require 'net/http'
require 'base64'

# Main GOBL namespace which has the differents structures to generate and
# load its components. There are sub-namespaces specically defined for GOBL
# objects, based on the GOBL JSON schema.
module GOBL
  def self.inflections
    {
      'gobl' => 'GOBL',
      'gobl_extensions' => 'GOBLExtensions',
      'uuid' => 'UUID',
      'url' => 'URL',
      'item_id' => 'ItemID',
      'tax_id' => 'TaxID',
      'dsig' => 'DSig'
    }
  end

  def self.loader
    @loader ||= create_loader
  end

  def self.create_loader
    loader = Zeitwerk::Loader.for_gem
    loader.inflector.inflect(inflections)
    loader
  end

  def self.config
    @config ||= Config.new
  end
end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.acronym 'GOBL'
  inflect.acronym 'UUID'
  inflect.acronym 'URL'
  inflect.acronym 'DSig'
  # inflect.acronym 'ItemID'
  # inflect.acronym 'TaxID'
end

require_relative 'types'
require_relative 'id'

GOBL.loader.setup

require_relative 'extensions'

GOBL.extend GOBL::Operations
