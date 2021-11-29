# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   bill_invoice_json = GOBL::Bill::Invoice.from! "{…}"
#   puts bill_invoice.totals.taxes&.categories&.first.rates.first
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'



# For when the postal address is not sufficient
class GOBL::Org::Coordinates < Dry::Struct

  # Single string coordinate based on geohash standard.
  attribute :geohash, Types::String.optional

  # Decimal latitude coordinate.
  attribute :lat, Types::Double.optional

  # Decimal longitude coordinate.
  attribute :lon, Types::Double.optional

  # Text coordinates compose of three words.
  attribute :w3_w, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      geohash: d["geohash"],
      lat:     d["lat"],
      lon:     d["lon"],
      w3_w:    d["w3w"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "geohash" => @geohash,
      "lat"     => @lat,
      "lon"     => @lon,
      "w3w"     => @w3_w,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

# Bank office branch address
class GOBL::Org::Address < Dry::Struct

  # Block number within the building.
  attribute :block, Types::String.optional

  # Post or ZIP code.
  attribute :code, Types::String.optional

  # For when the postal address is not sufficient
  attribute :coords, GOBL::Org::Coordinates.optional

  # ISO country code.
  attribute :country, Types::String.optional

  # Door number within the building.
  attribute :door, Types::String.optional

  # Floor number within the building.
  attribute :floor, Types::String.optional

  # Useful identifier
  attribute :label, Types::String.optional

  # The village
  attribute :locality, Types::String

  attribute :org_address_meta, Types::Hash.meta(of: Types::String).optional

  # House or building number in the street.
  attribute :num, Types::String.optional

  # Box number or code for the post office box located at the address.
  attribute :po_box, Types::String.optional

  # Province
  attribute :region, Types::String

  # Fist line of street.
  attribute :street, Types::String.optional

  # Additional street address details.
  attribute :street_extra, Types::String.optional

  attribute :uuid, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      block:            d["block"],
      code:             d["code"],
      coords:           d["coords"] ? GOBL::Org::Coordinates.from_dynamic!(d["coords"]) : nil,
      country:          d["country"],
      door:             d["door"],
      floor:            d["floor"],
      label:            d["label"],
      locality:         d.fetch("locality"),
      org_address_meta: Types::Hash.optional[d["meta"]]&.map { |k, v| [k, Types::String[v]] }&.to_h,
      num:              d["num"],
      po_box:           d["po_box"],
      region:           d.fetch("region"),
      street:           d["street"],
      street_extra:     d["street_extra"],
      uuid:             d["uuid"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "block"        => @block,
      "code"         => @code,
      "coords"       => @coords&.to_dynamic,
      "country"      => @country,
      "door"         => @door,
      "floor"        => @floor,
      "label"        => @label,
      "locality"     => @locality,
      "meta"         => @org_address_meta,
      "num"          => @num,
      "po_box"       => @po_box,
      "region"       => @region,
      "street"       => @street,
      "street_extra" => @street_extra,
      "uuid"         => @uuid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Org::Email < Dry::Struct

  # Electronic mailing address.
  attribute :addr, Types::String

  # Identifier for the email.
  attribute :label, Types::String.optional

  # Additional fields.
  attribute :org_email_meta, Types::Hash.meta(of: Types::String).optional

  attribute :uuid, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      addr:           d.fetch("addr"),
      label:          d["label"],
      org_email_meta: Types::Hash.optional[d["meta"]]&.map { |k, v| [k, Types::String[v]] }&.to_h,
      uuid:           d["uuid"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "addr"  => @addr,
      "label" => @label,
      "meta"  => @org_email_meta,
      "uuid"  => @uuid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

# Complete details on the name of the person
class GOBL::Org::Name < Dry::Struct

  # What the person would like to be called
  attribute :alias, Types::String.optional

  # The person's given name
  attribute :given, Types::String

  attribute :org_name_meta, Types::Hash.meta(of: Types::String).optional

  # Middle names or initials
  attribute :middle, Types::String.optional

  attribute :prefix,   Types::String.optional
  attribute :suffix,   Types::String.optional
  attribute :surname,  Types::String
  attribute :surname2, Types::String.optional

  # Unique identity code
  attribute :uuid, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      alias:         d["alias"],
      given:         d.fetch("given"),
      org_name_meta: Types::Hash.optional[d["meta"]]&.map { |k, v| [k, Types::String[v]] }&.to_h,
      middle:        d["middle"],
      prefix:        d["prefix"],
      suffix:        d["suffix"],
      surname:       d.fetch("surname"),
      surname2:      d["surname2"],
      uuid:          d["uuid"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "alias"    => @alias,
      "given"    => @given,
      "meta"     => @org_name_meta,
      "middle"   => @middle,
      "prefix"   => @prefix,
      "suffix"   => @suffix,
      "surname"  => @surname,
      "surname2" => @surname2,
      "uuid"     => @uuid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Org::Person < Dry::Struct

  # Electronic mail addresses that belong to the person.
  attribute :emails, Types.Array(GOBL::Org::Email).optional

  # Data about the data.
  attribute :org_person_meta, Types::Hash.meta(of: Types::String).optional

  # Complete details on the name of the person
  attribute :org_person_name, GOBL::Org::Name

  # What they do within an organization
  attribute :role, Types::String.optional

  # Unique identity code
  attribute :uuid, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      emails:          d["emails"]&.map { |x| GOBL::Org::Email.from_dynamic!(x) },
      org_person_meta: Types::Hash.optional[d["meta"]]&.map { |k, v| [k, Types::String[v]] }&.to_h,
      org_person_name: GOBL::Org::Name.from_dynamic!(d.fetch("name")),
      role:            d["role"],
      uuid:            d["uuid"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "emails" => @emails&.map { |x| x.to_dynamic },
      "meta"   => @org_person_meta,
      "name"   => @org_person_name.to_dynamic,
      "role"   => @role,
      "uuid"   => @uuid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

# The entity's legal ID code used for tax purposes. They may have other numbers
class GOBL::Org::TaxID < Dry::Struct

  # Identity code.
  attribute :code, Types::String

  # ISO country code for Where the tax identity was issued.
  attribute :country, Types::String

  # Additional details.
  attribute :org_tax_id_meta, Types::Hash.meta(of: Types::String).optional

  # Unique identity code
  attribute :uuid, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      code:            d.fetch("code"),
      country:         d.fetch("country"),
      org_tax_id_meta: Types::Hash.optional[d["meta"]]&.map { |k, v| [k, Types::String[v]] }&.to_h,
      uuid:            d["uuid"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "code"    => @code,
      "country" => @country,
      "meta"    => @org_tax_id_meta,
      "uuid"    => @uuid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Org::Telephone < Dry::Struct

  # Identifier for this number.
  attribute :label, Types::String.optional

  # The number to be dialed in ITU E.164 international format.
  attribute :num, Types::String

  attribute :uuid, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      label: d["label"],
      num:   d.fetch("num"),
      uuid:  d["uuid"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "label" => @label,
      "num"   => @num,
      "uuid"  => @uuid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

# Legal entity who receives the goods or services. May be empty in certain circumstances
# such as simplified invoices.
#
# The party who will receive delivery of the goods defined in the invoice and is not
# responsible for taxes.
#
# Party who is selling the goods and is not responsible for taxes.
#
# The party responsible for paying for the invoice
#
# The taxable entity supplying the goods or services.
class GOBL::Org::Party < Dry::Struct

  # Regular post addresses for where information should be sent if needed.
  attribute :addresses, Types.Array(GOBL::Org::Address).optional

  # Alternate short name.
  attribute :alias, Types::String.optional

  attribute :emails, Types.Array(GOBL::Org::Email).optional

  # Any additional non-structure information that does not fit into the rest of the document.
  attribute :org_party_meta, Types::Hash.meta(of: Types::String).optional

  # Legal name or representation of the organization.
  attribute :org_party_name, Types::String

  # Details of physical people who represent the party.
  attribute :people, Types.Array(GOBL::Org::Person).optional

  # The entity's legal ID code used for tax purposes. They may have other numbers
  attribute :tax_id, GOBL::Org::TaxID.optional

  attribute :telephones, Types.Array(GOBL::Org::Telephone).optional

  # Unique identity code.
  attribute :uuid, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      addresses:      d["addresses"]&.map { |x| GOBL::Org::Address.from_dynamic!(x) },
      alias:          d["alias"],
      emails:         d["emails"]&.map { |x| GOBL::Org::Email.from_dynamic!(x) },
      org_party_meta: Types::Hash.optional[d["meta"]]&.map { |k, v| [k, Types::String[v]] }&.to_h,
      org_party_name: d.fetch("name"),
      people:         d["people"]&.map { |x| GOBL::Org::Person.from_dynamic!(x) },
      tax_id:         d["tax_id"] ? GOBL::Org::TaxID.from_dynamic!(d["tax_id"]) : nil,
      telephones:     d["telephones"]&.map { |x| GOBL::Org::Telephone.from_dynamic!(x) },
      uuid:           d["uuid"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "addresses"  => @addresses&.map { |x| x.to_dynamic },
      "alias"      => @alias,
      "emails"     => @emails&.map { |x| x.to_dynamic },
      "meta"       => @org_party_meta,
      "name"       => @org_party_name,
      "people"     => @people&.map { |x| x.to_dynamic },
      "tax_id"     => @tax_id&.to_dynamic,
      "telephones" => @telephones&.map { |x| x.to_dynamic },
      "uuid"       => @uuid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Bill::Delivery < Dry::Struct

  # The party who will receive delivery of the goods defined in the invoice and is not
  # responsible for taxes.
  attribute :receiver, GOBL::Org::Party.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      receiver: d["receiver"] ? GOBL::Org::Party.from_dynamic!(d["receiver"]) : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "receiver" => @receiver&.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

# Discount applied to this line.
class GOBL::Org::Discount < Dry::Struct

  # Reason Code
  attribute :code, Types::String.optional

  attribute :rate, Types::String.optional

  # Description as to why this discount was applied.
  attribute :reason, Types::String.optional

  # How much to deduct
  attribute :value, Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      code:   d["code"],
      rate:   d["rate"],
      reason: d["reason"],
      value:  d.fetch("value"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "code"   => @code,
      "rate"   => @rate,
      "reason" => @reason,
      "value"  => @value,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Org::ItemID < Dry::Struct
  attribute :value, Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      value: d.fetch("value"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "value" => @value,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Org::Item < Dry::Struct

  # Only required if this line has a different currency from the rest.
  attribute :currency, Types::String.optional

  attribute :desc,          Types::String.optional
  attribute :org_item_meta, Types::Hash.meta(of: Types::String).optional
  attribute :org_item_name, Types::String

  # Country code of where this item was from originally.
  attribute :origin, Types::String.optional

  # Price of item being sold.
  attribute :price, Types::String

  attribute :supplier_ids, Types.Array(GOBL::Org::ItemID).optional

  # Code for unit of the item being sold
  attribute :unit, Types::String.optional

  # Unique identify of this item independent of the Supplier IDs
  attribute :uuid, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      currency:      d["currency"],
      desc:          d["desc"],
      org_item_meta: Types::Hash.optional[d["meta"]]&.map { |k, v| [k, Types::String[v]] }&.to_h,
      org_item_name: d.fetch("name"),
      origin:        d["origin"],
      price:         d.fetch("price"),
      supplier_ids:  d["supplier_ids"]&.map { |x| GOBL::Org::ItemID.from_dynamic!(x) },
      unit:          d["unit"],
      uuid:          d["uuid"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "currency"     => @currency,
      "desc"         => @desc,
      "meta"         => @org_item_meta,
      "name"         => @org_item_name,
      "origin"       => @origin,
      "price"        => @price,
      "supplier_ids" => @supplier_ids&.map { |x| x.to_dynamic },
      "unit"         => @unit,
      "uuid"         => @uuid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Tax::Rate < Dry::Struct

  # From the available options for the region.
  attribute :cat, Types::String

  # As defined for the region and category.
  attribute :code, Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      cat:  d.fetch("cat"),
      code: d.fetch("code"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "cat"  => @cat,
      "code" => @code,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Bill::Line < Dry::Struct

  # Discount applied to this line.
  attribute :discount, GOBL::Org::Discount.optional

  # Line number inside the invoice.
  attribute :i, Types::Int

  attribute :item,     GOBL::Org::Item
  attribute :quantity, Types::String

  # Result of quantity multiplied by item price
  attribute :sum, Types::String

  # List of taxes to be applied to the line in the invoice totals.
  attribute :taxes, Types.Array(GOBL::Tax::Rate).optional

  # Total line amount after applying discounts to the sum.
  attribute :total, Types::String

  attribute :uuid, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      discount: d["discount"] ? GOBL::Org::Discount.from_dynamic!(d["discount"]) : nil,
      i:        d.fetch("i"),
      item:     GOBL::Org::Item.from_dynamic!(d.fetch("item")),
      quantity: d.fetch("quantity"),
      sum:      d.fetch("sum"),
      taxes:    d["taxes"]&.map { |x| GOBL::Tax::Rate.from_dynamic!(x) },
      total:    d.fetch("total"),
      uuid:     d["uuid"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "discount" => @discount&.to_dynamic,
      "i"        => @i,
      "item"     => @item.to_dynamic,
      "quantity" => @quantity,
      "sum"      => @sum,
      "taxes"    => @taxes&.map { |x| x.to_dynamic },
      "total"    => @total,
      "uuid"     => @uuid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Bill::Ordering < Dry::Struct

  # Party who is selling the goods and is not responsible for taxes.
  attribute :seller, GOBL::Org::Party.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      seller: d["seller"] ? GOBL::Org::Party.from_dynamic!(d["seller"]) : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "seller" => @seller&.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Bill::Outlay < Dry::Struct

  # Details on what the outlay was.
  attribute :desc, Types::String

  # Line number inside the invoice
  attribute :i, Types::Int

  # Amount paid by the supplier.
  attribute :paid, Types::String

  # A code
  attribute :ref, Types::String.optional

  attribute :uuid, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      desc: d.fetch("desc"),
      i:    d.fetch("i"),
      paid: d.fetch("paid"),
      ref:  d["ref"],
      uuid: d["uuid"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "desc" => @desc,
      "i"    => @i,
      "paid" => @paid,
      "ref"  => @ref,
      "uuid" => @uuid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

# Details on how to pay using a bank transfer or wire.
class GOBL::Pay::BankTransfer < Dry::Struct

  # Bank Identifier Code used for international transfers.
  attribute :bic, Types::String.optional

  # Bank office branch address
  attribute :branch, GOBL::Org::Address.optional

  # International Bank Account Number
  attribute :iban, Types::String.optional

  # Non-structured additional data that may be useful.
  attribute :pay_bank_transfer_meta, Types::Hash.meta(of: Types::String).optional

  # Name of the bank.
  attribute :pay_bank_transfer_name, Types::String.optional

  # Any additional instructions that may be required to make the transfer.
  attribute :notes, Types::Hash.meta(of: Types::Any).optional

  # Account number
  attribute :number, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      bic:                    d["bic"],
      branch:                 d["branch"] ? GOBL::Org::Address.from_dynamic!(d["branch"]) : nil,
      iban:                   d["iban"],
      pay_bank_transfer_meta: Types::Hash.optional[d["meta"]]&.map { |k, v| [k, Types::String[v]] }&.to_h,
      pay_bank_transfer_name: d["name"],
      notes:                  Types::Hash.optional[d["notes"]]&.map { |k, v| [k, Types::Any[v]] }&.to_h,
      number:                 d["number"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "bic"    => @bic,
      "branch" => @branch&.to_dynamic,
      "iban"   => @iban,
      "meta"   => @pay_bank_transfer_meta,
      "name"   => @pay_bank_transfer_name,
      "notes"  => @notes,
      "number" => @number,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

# Web address that can be used for making the payment. Likely to be custom for each
# document.
class GOBL::Pay::URL < Dry::Struct

  # Full URL to be used for payment.
  attribute :addr, Types::String

  # Semi-structured additional data.
  attribute :pay_url_meta, Types::Hash.meta(of: Types::String).optional

  # Additional details which may be useful to the end-user.
  attribute :notes, Types::String.optional

  attribute :uuid, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      addr:         d.fetch("addr"),
      pay_url_meta: Types::Hash.optional[d["meta"]]&.map { |k, v| [k, Types::String[v]] }&.to_h,
      notes:        d["notes"],
      uuid:         d["uuid"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "addr"  => @addr,
      "meta"  => @pay_url_meta,
      "notes" => @notes,
      "uuid"  => @uuid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Pay::Method < Dry::Struct

  # Details on how to pay using a bank transfer or wire.
  attribute :bank_transfer, GOBL::Pay::BankTransfer.optional

  # Code for the method type that can be used.
  attribute :code, Types::String

  # Additional non-structure data.
  attribute :pay_method_meta, Types::Hash.meta(of: Types::String).optional

  # Additional details related to this payment method.
  attribute :notes, Types::String.optional

  # Web address that can be used for making the payment. Likely to be custom for each
  # document.
  attribute :url, GOBL::Pay::URL.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      bank_transfer:   d["bank_transfer"] ? GOBL::Pay::BankTransfer.from_dynamic!(d["bank_transfer"]) : nil,
      code:            d.fetch("code"),
      pay_method_meta: Types::Hash.optional[d["meta"]]&.map { |k, v| [k, Types::String[v]] }&.to_h,
      notes:           d["notes"],
      url:             d["url"] ? GOBL::Pay::URL.from_dynamic!(d["url"]) : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "bank_transfer" => @bank_transfer&.to_dynamic,
      "code"          => @code,
      "meta"          => @pay_method_meta,
      "notes"         => @notes,
      "url"           => @url&.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

# Payment terms or conditions.
class GOBL::Pay::Terms < Dry::Struct

  # Type of terms to be applied.
  attribute :code, Types::String

  # Description of the conditions for payment.
  attribute :notes, Types::Hash.meta(of: Types::Any).optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      code:  d.fetch("code"),
      notes: Types::Hash.optional[d["notes"]]&.map { |k, v| [k, Types::Any[v]] }&.to_h,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "code"  => @code,
      "notes" => @notes,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Bill::Payment < Dry::Struct

  # Array of payment options that can be used to pay for this invoice.
  attribute :bill_payment_methods, Types.Array(GOBL::Pay::Method).optional

  # The party responsible for paying for the invoice
  attribute :payer, GOBL::Org::Party.optional

  # Payment terms or conditions.
  attribute :terms, GOBL::Pay::Terms.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      bill_payment_methods: d["methods"]&.map { |x| GOBL::Pay::Method.from_dynamic!(x) },
      payer:                d["payer"] ? GOBL::Org::Party.from_dynamic!(d["payer"]) : nil,
      terms:                d["terms"] ? GOBL::Pay::Terms.from_dynamic!(d["terms"]) : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "methods" => @bill_payment_methods&.map { |x| x.to_dynamic },
      "payer"   => @payer&.to_dynamic,
      "terms"   => @terms&.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

# Key information regarding a previous invoice.
class GOBL::Bill::Preceding < Dry::Struct

  # Identity code of the previous invoice.
  attribute :code, Types::String

  # When the preceding invoices was issued.
  attribute :issue_date, Types::String

  # Additional semi-structured data that may be useful in specific regions.
  attribute :bill_preceding_meta, Types::Hash.meta(of: Types::String).optional

  # Preceding document's UUID if available can be useful for tracing.
  attribute :uuid, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      code:                d.fetch("code"),
      issue_date:          d.fetch("issue_date"),
      bill_preceding_meta: Types::Hash.optional[d["meta"]]&.map { |k, v| [k, Types::String[v]] }&.to_h,
      uuid:                d["uuid"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "code"       => @code,
      "issue_date" => @issue_date,
      "meta"       => @bill_preceding_meta,
      "uuid"       => @uuid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Currency::ExchangeRate < Dry::Struct
  attribute :currency, Types::String
  attribute :value,    Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      currency: d.fetch("currency"),
      value:    d.fetch("value"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "currency" => @currency,
      "value"    => @value,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Tax::RateTotal < Dry::Struct
  attribute :base,    Types::String
  attribute :code,    Types::String
  attribute :percent, Types::String
  attribute :value,   Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      base:    d.fetch("base"),
      code:    d.fetch("code"),
      percent: d.fetch("percent"),
      value:   d.fetch("value"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "base"    => @base,
      "code"    => @code,
      "percent" => @percent,
      "value"   => @value,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Tax::CategoryTotal < Dry::Struct
  attribute :base,     Types::String
  attribute :code,     Types::String
  attribute :rates,    Types.Array(GOBL::Tax::RateTotal)
  attribute :retained, Types::Bool.optional
  attribute :value,    Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      base:     d.fetch("base"),
      code:     d.fetch("code"),
      rates:    d.fetch("rates").map { |x| GOBL::Tax::RateTotal.from_dynamic!(x) },
      retained: d["retained"],
      value:    d.fetch("value"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "base"     => @base,
      "code"     => @code,
      "rates"    => @rates.map { |x| x.to_dynamic },
      "retained" => @retained,
      "value"    => @value,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

# Summary of all taxes with a final sum to add or deduct from the amount payable.
class GOBL::Tax::Total < Dry::Struct
  attribute :categories, Types.Array(GOBL::Tax::CategoryTotal).optional

  # Total value of all the taxes to be added or retained.
  attribute :sum, Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      categories: d["categories"]&.map { |x| GOBL::Tax::CategoryTotal.from_dynamic!(x) },
      sum:        d.fetch("sum"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "categories" => @categories&.map { |x| x.to_dynamic },
      "sum"        => @sum,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Bill::Totals < Dry::Struct

  # Sum of all discounts applied to each line.
  attribute :discount, Types::String.optional

  # Total paid in outlays that need to be reimbursed.
  attribute :outlays, Types::String.optional

  # Total amount to be paid after applying taxes.
  attribute :payable, Types::String

  # Sum of all line item sums
  attribute :sum, Types::String

  # Summary of all taxes with a final sum to add or deduct from the amount payable.
  attribute :taxes, GOBL::Tax::Total.optional

  # Sum of all line sums minus the discounts.
  attribute :total, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      discount: d["discount"],
      outlays:  d["outlays"],
      payable:  d.fetch("payable"),
      sum:      d.fetch("sum"),
      taxes:    d["taxes"] ? GOBL::Tax::Total.from_dynamic!(d["taxes"]) : nil,
      total:    d["total"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "discount" => @discount,
      "outlays"  => @outlays,
      "payable"  => @payable,
      "sum"      => @sum,
      "taxes"    => @taxes&.to_dynamic,
      "total"    => @total,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GOBL::Bill::Invoice < Dry::Struct

  # Sequential code used to identify this invoice in tax declarations.
  attribute :code, Types::String

  # Currency for all invoice totals.
  attribute :currency, Types::String

  # Legal entity who receives the goods or services. May be empty in certain circumstances
  # such as simplified invoices.
  attribute :customer, GOBL::Org::Party.optional

  attribute :delivery, GOBL::Bill::Delivery.optional

  # When the invoice was created.
  attribute :issue_date, Types::String

  # The items sold to the customer.
  attribute :lines, Types.Array(GOBL::Bill::Line).optional

  # Additional semi-structured data that doesn't fit into the body of the invoice.
  attribute :bill_invoice_meta, Types::Hash.meta(of: Types::String).optional

  # Unstructured information that is relevant to the invoice
  attribute :notes, Types::String.optional

  # Date when the operation defined by the invoice became effective.
  attribute :op_date, Types::String.optional

  attribute :ordering, GOBL::Bill::Ordering.optional

  # Expenses paid for by the supplier but invoiced directly to the customer.
  attribute :outlays, Types.Array(GOBL::Bill::Outlay).optional

  attribute :payment, GOBL::Bill::Payment.optional

  # Key information regarding a previous invoice.
  attribute :preceding, GOBL::Bill::Preceding.optional

  # When true
  attribute :prices_include_tax, Types::Bool.optional

  # Exchange rates to be used when converting the invoices monetary values into other
  # currencies.
  attribute :rates, Types.Array(GOBL::Currency::ExchangeRate).optional

  # The taxable entity supplying the goods or services.
  attribute :supplier, GOBL::Org::Party

  attribute :totals, GOBL::Bill::Totals

  # Functional type of the invoice
  attribute :type_code, Types::String.optional

  # Unique document ID. Not required
  attribute :uuid, Types::String.optional

  # When the taxes of this invoice become accountable
  attribute :value_date, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      code:                          d.fetch("code"),
      currency:                      d.fetch("currency"),
      customer:                      d["customer"] ? GOBL::Org::Party.from_dynamic!(d["customer"]) : nil,
      delivery:                      d["delivery"] ? GOBL::Bill::Delivery.from_dynamic!(d["delivery"]) : nil,
      issue_date:                    d.fetch("issue_date"),
      lines:                         d["lines"]&.map { |x| GOBL::Bill::Line.from_dynamic!(x) },
      bill_invoice_meta: Types::Hash.optional[d["meta"]]&.map { |k, v| [k, Types::String[v]] }&.to_h,
      notes:                         d["notes"],
      op_date:                       d["op_date"],
      ordering:                      d["ordering"] ? GOBL::Bill::Ordering.from_dynamic!(d["ordering"]) : nil,
      outlays:                       d["outlays"]&.map { |x| GOBL::Bill::Outlay.from_dynamic!(x) },
      payment:                       d["payment"] ? GOBL::Bill::Payment.from_dynamic!(d["payment"]) : nil,
      preceding:                     d["preceding"] ? GOBL::Bill::Preceding.from_dynamic!(d["preceding"]) : nil,
      prices_include_tax:            d["prices_include_tax"],
      rates:                         d["rates"]&.map { |x| GOBL::Currency::ExchangeRate.from_dynamic!(x) },
      supplier:                      GOBL::Org::Party.from_dynamic!(d.fetch("supplier")),
      totals:                        GOBL::Bill::Totals.from_dynamic!(d.fetch("totals")),
      type_code:                     d["type_code"],
      uuid:                          d["uuid"],
      value_date:                    d["value_date"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "code"               => @code,
      "currency"           => @currency,
      "customer"           => @customer&.to_dynamic,
      "delivery"           => @delivery&.to_dynamic,
      "issue_date"         => @issue_date,
      "lines"              => @lines&.map { |x| x.to_dynamic },
      "meta"               => @bill_invoice_meta,
      "notes"              => @notes,
      "op_date"            => @op_date,
      "ordering"           => @ordering&.to_dynamic,
      "outlays"            => @outlays&.map { |x| x.to_dynamic },
      "payment"            => @payment&.to_dynamic,
      "preceding"          => @preceding&.to_dynamic,
      "prices_include_tax" => @prices_include_tax,
      "rates"              => @rates&.map { |x| x.to_dynamic },
      "supplier"           => @supplier.to_dynamic,
      "totals"             => @totals.to_dynamic,
      "type_code"          => @type_code,
      "uuid"               => @uuid,
      "value_date"         => @value_date,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
