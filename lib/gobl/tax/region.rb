# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   tax_region_json = GOBL::Tax::Region.from! "{…}"
#   puts tax_region.categories.first.defs.first.values.first
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'



class GOBL::Tax::Value < Dry::Struct

  # When true
  attribute :disabled, Types::Bool.optional

  # Rate that should be applied.
  attribute :percent, Types::String

  # Date from which this value should be applied.
  attribute :since, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      disabled: d["disabled"],
      percent:  d.fetch("percent"),
      since:    d["since"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "disabled" => @disabled,
      "percent"  => @percent,
      "since"    => @since,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Tax::Def < Dry::Struct
  attribute :code,         Types::String
  attribute :desc,         Types::Hash.meta(of: Types::Any).optional.optional
  attribute :tax_def_name, Types::Hash.meta(of: Types::Any).optional

  # Set of values ordered by date that determine what rates to apply since when.
  attribute :values, Types.Array(GOBL::Tax::Value)

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      code:         d.fetch("code"),
      desc:         Types::Hash.optional[d["desc"]]&.map { |k, v| [k, Types::Any[v]] }&.to_h,
      tax_def_name: Types::Hash.optional[d.fetch("name")]&.map { |k, v| [k, Types::Any[v]] }&.to_h,
      values:       d.fetch("values").map { |x| GOBL::Tax::Value.from_dynamic!(x) },
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "code"   => @code,
      "desc"   => @desc,
      "name"   => @tax_def_name,
      "values" => @values.map { |x| x.to_dynamic },
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Tax::Category < Dry::Struct
  attribute :code,              Types::String
  attribute :defs,              Types.Array(GOBL::Tax::Def)
  attribute :desc,              Types::Hash.meta(of: Types::Any).optional.optional
  attribute :tax_category_name, Types::Hash.meta(of: Types::Any).optional

  # This tax should be retained
  attribute :retained, Types::Bool.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      code:              d.fetch("code"),
      defs:              d.fetch("defs").map { |x| GOBL::Tax::Def.from_dynamic!(x) },
      desc:              Types::Hash.optional[d["desc"]]&.map { |k, v| [k, Types::Any[v]] }&.to_h,
      tax_category_name: Types::Hash.optional[d.fetch("name")]&.map { |k, v| [k, Types::Any[v]] }&.to_h,
      retained:          d["retained"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "code"     => @code,
      "defs"     => @defs.map { |x| x.to_dynamic },
      "desc"     => @desc,
      "name"     => @tax_category_name,
      "retained" => @retained,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Tax::Region < Dry::Struct
  attribute :categories,                  Types.Array(GOBL::Tax::Category)
  attribute :code,                        Types::String
  attribute :tax_region_name, Types::Hash.meta(of: Types::Any).optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      categories:                  d.fetch("categories").map { |x| GOBL::Tax::Category.from_dynamic!(x) },
      code:                        d.fetch("code"),
      tax_region_name: Types::Hash.optional[d.fetch("name")]&.map { |k, v| [k, Types::Any[v]] }&.to_h,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "categories" => @categories.map { |x| x.to_dynamic },
      "code"       => @code,
      "name"       => @tax_region_name,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
