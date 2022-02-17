module GOBLExtensions
  module Envelope
    module DocumentHelper
      # Envelope 'from_json!' method overrides the auto generated definition to
      # take into account the envelope type.
      def from_json!(json)
        return if json.nil?

        instance = from_gobl!(JSON.parse(json))

        kls = fetch_object(instance.head.typ)
        instance.attributes[:doc] = kls.from_gobl!(instance.doc.value)

        instance
      end
    end
  end
end
