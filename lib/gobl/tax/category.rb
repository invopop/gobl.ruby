# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Tax
    class Category < Model::Struct
      attribute :code, Model::Types::String

      attribute :name, (Model::Types::Hash | Model::Types::Nil)

      attribute :desc, (Model::Types::Hash | Model::Types::Nil).optional

      # This tax should be retained
      attribute :retained, Model::Types::Bool.optional

      attribute :defs, Model::Types::Array(GOBL::Tax::Def)

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          code: gobl['code'],
          name: gobl['name'],
          desc: gobl['desc'],
          retained: gobl['retained'],
          defs: gobl['defs']&.map { |x| GOBL::Tax::Def.from_gobl!(x) }
        )
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'name' => attributes[:name],
          'desc' => attributes[:desc],
          'retained' => attributes[:retained],
          'defs' => attributes[:defs]&.map { |x| x&.to_gobl }
        }
      end
    end
  end
end
