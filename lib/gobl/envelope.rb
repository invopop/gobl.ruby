# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   envelope_json = GOBL::Envelope.from! "{…}"
#   puts envelope.sigs.first
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'



# Digest of the canonical JSON body.
class GOBL::Dsig::Digest < Dry::Struct
  attribute :alg, Types::String
  attribute :val, Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      alg: d.fetch("alg"),
      val: d.fetch("val"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "alg" => @alg,
      "val" => @val,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Stamp < Dry::Struct

  # Identity of the agency used to create the stamp
  attribute :prv, Types::String

  # The serialized stamp value generated for or by the external agency
  attribute :val, Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      prv: d.fetch("prv"),
      val: d.fetch("val"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "prv" => @prv,
      "val" => @val,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

# Details on what the contents are
class GOBL::Header < Dry::Struct

  # Digest of the canonical JSON body.
  attribute :dig, GOBL::Dsig::Digest

  # When true
  attribute :draft, Types::Bool.optional

  # Additional semi-structured information about this envelope.
  attribute :header_meta, Types::Hash.meta(of: Types::String).optional

  # Any information that may be relevant to other humans about this envelope.
  attribute :notes, Types::String.optional

  # Code for the region the document should be validated with.
  attribute :rgn, Types::String

  # Seals of approval from other organisations.
  attribute :stamps, Types.Array(GOBL::Stamp).optional

  # Set of labels that describe but have no influence on the data.
  attribute :tags, Types.Array(Types::String).optional

  # Body type of the document contents.
  attribute :typ, Types::String

  # Unique UUIDv1 identifier for the envelope.
  attribute :uuid, Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      dig:         GOBL::Dsig::Digest.from_dynamic!(d.fetch("dig")),
      draft:       d["draft"],
      header_meta: Types::Hash.optional[d["meta"]]&.map { |k, v| [k, Types::String[v]] }&.to_h,
      notes:       d["notes"],
      rgn:         d.fetch("rgn"),
      stamps:      d["stamps"]&.map { |x| GOBL::Stamp.from_dynamic!(x) },
      tags:        d["tags"],
      typ:         d.fetch("typ"),
      uuid:        d.fetch("uuid"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "dig"    => @dig.to_dynamic,
      "draft"  => @draft,
      "meta"   => @header_meta,
      "notes"  => @notes,
      "rgn"    => @rgn,
      "stamps" => @stamps&.map { |x| x.to_dynamic },
      "tags"   => @tags,
      "typ"    => @typ,
      "uuid"   => @uuid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Envelope < Dry::Struct

  # The data being enveloped
  attribute :doc, Types::Hash.meta(of: Types::Any)

  # Details on what the contents are
  attribute :head, GOBL::Header

  # JSON Web Signatures of the header
  attribute :sigs, Types.Array(Types::String)

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      doc:  Types::Hash[d.fetch("doc")].map { |k, v| [k, Types::Any[v]] }.to_h,
      head: GOBL::Header.from_dynamic!(d.fetch("head")),
      sigs: d.fetch("sigs"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "doc"  => @doc,
      "head" => @head.to_dynamic,
      "sigs" => @sigs,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
