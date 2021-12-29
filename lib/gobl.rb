# frozen_string_literal: true

require 'json'
require 'zeitwerk'

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
end

GOBL.loader.setup

module GOBL
  # Envelope 'from_json!' method overrides the auto generated definition to
  # take into account the envelope type.
  class Envelope
    # Returns a GoBL object for a given envelope type.
    def self.fetch_object(type)
      case type
      when 'bill.Invoice'
        GOBL::Bill::Invoice
      when 'note.Message'
        GOBL::Note::Message
      else
        raise 'envelope type not recognized'
      end
    end

    def self.from_json!(json)
      return if json.nil?

      instance = from_gobl!(JSON.parse(json))

      kls = fetch_object(instance.head.typ)
      instance.attributes[:doc] = kls.from_gobl!(instance.doc.value)

      instance
    end
  end
end
