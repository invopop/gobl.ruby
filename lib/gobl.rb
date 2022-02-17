# frozen_string_literal: true

require 'json'
require 'zeitwerk'

# Main GOBL namespace which has the differents structures to generate and
# load its components. There are sub-namespaces specically defined for GoBL
# objects, based on the GoBL JSON schema.
module GOBL
  def self.inflections
    {
      'gobl' => 'GOBL',
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

GOBL.loader.setup

require_relative 'extensions'
