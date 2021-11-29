# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   note_message_json = GOBL::Note::Message.from! "{…}"
#   puts note_message_json.schema_note_message_meta&["…"]
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'



class GOBL::Note::Message < Dry::Struct

  # Details of what exactly this message wants to communicate.
  attribute :content, Types::String

  # Any additional semi-structured data that might be useful.
  attribute :note_message_meta, Types::Hash.meta(of: Types::String).optional

  # Summary of the message content.
  attribute :title, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      content:                       d.fetch("content"),
      note_message_meta: Types::Hash.optional[d["meta"]]&.map { |k, v| [k, Types::String[v]] }&.to_h,
      title:                         d["title"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "content" => @content,
      "meta"    => @note_message_meta,
      "title"   => @title,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
