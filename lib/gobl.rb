# frozen_string_literal: true

require 'zeitwerk'

require_relative '../app/catalog'

# GOBL - Main namespace which has the differents structures to generate and
# load its components. There are sub-namespaces specically defined for GoBL
# objects, based on the GoBL JSON schema.
module GOBL
  def self.inflections
    {
      'gobl' => 'GOBL', 'uuid' => 'UUID', 'url' => 'URL',
      'item_id' => 'ItemID', 'tax_id' => 'TaxID'
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

  def self.catalog
    @catalog ||= create_catalog
  end

  def self.create_catalog
    catalog = Catalog.new('schema')
    catalog.inflect(inflections)
    catalog
  end

  # Returns a Ruby class for a given JSON schema definition name.
  def self.fetch_object(original_name)
    ns, kls = catalog.object_name(original_name)

    ns.const_get(kls) if ns.const_defined?(kls)
  end
end

GOBL.loader.setup

module GOBL
  # Envelope 'from_json!' method overrides the auto generated definition to
  # take into account the envelope type.
  class Envelope
    def self.from_json!(json)
      return if json.nil?

      instance = from_gobl!(JSON.parse(json))

      kls = GOBL.fetch_object(instance.head.typ)
      instance.attributes[:doc] = kls.from_gobl!(instance.doc.value)

      instance
    end
  end
end
