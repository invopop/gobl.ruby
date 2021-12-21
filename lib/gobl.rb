# frozen_string_literal: true

require_relative 'loader'

# GOBL - Main namespace which has the differents structures to generate and
# load its components. There are sub-namespaces specically defined for GoBL
# objects, based on the GoBL JSON schema.
module GOBL
  def self.loader
    @loader ||= create_loader
  end

  def self.create_loader
    loader = Loader.new(
      schema_dir: 'schema',
      gem_file: __FILE__,
      gem_dir: __dir__
    )

    loader.inflect(
      'gobl' => 'GOBL', 'uuid' => 'UUID', 'url' => 'URL',
      'item_id' => 'ItemID', 'tax_id' => 'TaxID'
    )
    loader
  end
end

GOBL.loader.setup

module GOBL
  # Envelope 'from_json!' method overrides the auto generated definition to
  # take into account the envelope type.
  class Envelope
    def self.from_json!(json)
      instance = from_object!(JSON.parse(json))

      kls = GOBL.loader.fetch_object(instance.head.typ)
      instance.attributes[:doc] = kls.from_object!(instance.doc)

      instance
    end
  end
end
