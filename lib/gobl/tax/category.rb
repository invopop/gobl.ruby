# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Tax
    class Category < Model::Struct
      attribute :code, Model::Types::String

      attribute :name, GOBL::I18n::String

      attribute :desc, GOBL::I18n::String.optional

      # This tax should be retained
      attribute :retained, Model::Types::Bool.optional

      attribute :defs, Model::Types::Array(GOBL::Tax::Def)

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          code: gobl['code'],
          name: GOBL::I18n::String.from_gobl!(gobl['name']),
          desc: gobl['desc'] ? GOBL::I18n::String.from_gobl!(gobl['desc']) : nil,
          retained: gobl['retained'],
          defs: gobl['defs']&.map { |x| GOBL::Tax::Def.from_gobl!(x) }
        )
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'name' => attributes[:name]&.to_gobl,
          'desc' => attributes[:desc]&.to_gobl,
          'retained' => attributes[:retained],
          'defs' => attributes[:defs]&.map { |x| x&.to_gobl }
        }
      end
    end
  end
end
