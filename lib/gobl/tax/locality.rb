# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Tax
    # Locality represents an area inside a region, like a province or a state, which shares the basic definitions of the region, but may vary in some validation rules.
    class Locality < GOBL::Struct
      # Code
      attribute :code, GOBL::L10n::Code

      # Name of the locality with local and hopefully international translations.
      attribute :name, GOBL::I18n::String

      # Any additional information
      attribute :meta, GOBL::Org::Meta.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          code: GOBL::L10n::Code.from_gobl!(data['code']),
          name: GOBL::I18n::String.from_gobl!(data['name']),
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      def to_gobl
        {
          'code' => attributes[:code]&.to_gobl,
          'name' => attributes[:name]&.to_gobl,
          'meta' => attributes[:meta]&.to_gobl
        }
      end
    end
  end
end

