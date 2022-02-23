# frozen_string_literal: true

require 'json'
require 'zeitwerk'
require 'dry-types'
require 'active_support/core_ext/string/inflections'

# Main GOBL namespace which has the differents structures to generate and
# load its components. There are sub-namespaces specically defined for GoBL
# objects, based on the GoBL JSON schema.
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
