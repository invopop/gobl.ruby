# frozen_string_literal: true

module GOBL
  module Extensions
    module Envelope
      module HeaderTypeHelper
        # Returns a GoBL object for a given envelope type.
        def fetch_object(type)
          case type
          when 'bill.Invoice'
            GOBL::Bill::Invoice
          when 'note.Message'
            GOBL::Note::Message
          else
            raise 'envelope type not recognized'
          end
        end
      end
    end
  end
end
