# frozen_string_literal: true

require 'zeitwerk'

require_relative 'generator'

# GOBL parent module
module GOBL; end

loader = Zeitwerk::Loader.for_gem

loader.inflector.inflect('gobl' => 'GOBL')
loader.inflector.inflect('uuid' => 'UUID')
loader.inflector.inflect('url' => 'URL')

loader.inflector.inflect('item_id' => 'ItemID') # FIXME
loader.inflector.inflect('tax_id' => 'TaxID') # FIXME

loader.setup
loader.eager_load

module GOBL
  # Envelope 'from_json!' method override to take into account the envelope
  # type
  class Envelope
    def self.from_json!(json)
      instance = from_object!(JSON.parse(json))

      cls = Dynamic.fetch_object(instance.head.typ)
      instance.attributes[:doc] = cls.from_object!(instance.doc.value)

      instance
    end
  end
end

Generator.enhance('schema')
