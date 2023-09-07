# GOBL Ruby

<img src="https://github.com/invopop/gobl/blob/main/gobl_logo_black_rgb.svg?raw=true" width="181" height="219" alt="GOBL Logo">

Go Business Language – Ruby.

Released under the Apache 2.0 [LICENSE](https://github.com/invopop/gobl/blob/main/LICENSE), Copyright 2021,2022 [Invopop Ltd.](https://invopop.com). Trademark pending.

## Introduction

Ruby library for reading, producing, manipulating and operating over [GOBL][3] documents and structures.

### Features

- Dedicated Ruby classes for each GOBL structure with typed attributes
- [Object instantiation from nested hashes and arrays of attributes](#instantiating-structures)
- [Object serialization/deserialization to/from JSON GOBL data](#serializing-to-and-deserializing-from-json)
- [Idiomatic value objects with enumerations support](#handling-value-objects-and-enumerations)
- Access to operations in the [GOBL CLI][4] service: [build, validate and sign](#running-operations)
- [Full API reference documentation][1]

### Documentation

- [User guide](#user-guide)
- [API reference][6]
- [GOBL documentation][2]

## User guide

### Installation

Add this line to your application's Gemfile:

```ruby
gem 'gobl'
```

And then execute:

```shell
bundle install
```

### Instantiating structures

You can instantiate any struct in the library using a hash of nested attributes. For example:

```ruby
invoice = GOBL::Bill::Invoice.new(
  code: 'SAMPLE-001',
  currency: :eur,
  issue_date: Date.new(2021, 1, 1),
  supplier: { tax_id: { country: :es, code: '55105445K' }, name: 'Provide One S.L.' },
  customer: { tax_id: { country: :es, code: '65870696F' }, name: 'Sample Consumer' },
  lines: [{
    quantity: 20,
    item: { name: 'Development services', price: 90.0 },
    taxes: [ { cat: 'VAT', rate: :standard } ]
  }]
)
invoice #=> #<GOBL::Bill::Invoice uuid=nil code="SAMPLE-001" ...>
invoice.code # => "SAMPLE-001"
invoice.currency # => #<GOBL::Currency::Code _value="EUR">
invoice.date # => #<GOBL::Cal::Date _value="2021-01-01">
invoice.lines.first.item.price #=> #<GOBL::Num::Amount:... @value=900, @exp=1>
```

Note how the constructor took care of creating every nested object in the attributes hash and also coercing strings, symbols and dates into GOBL objects.

The constructor requires any attribute marked as mandatory and not calculated in the GOBL schema to be present in the input data. Otherwise, it will raise an error. For example:

```ruby
message = GOBL::Note::Message.new #=> Dry::Struct::Error ([GOBL::Note::Message.new] :content is missing in Hash input)
```

_See also: [`GOBL::Bill::Invoice#new`](https://rubydoc.info/github/invopop/gobl.ruby/GOBL/Bill/Invoice#new-class_method)_

### Serializing to and deserializing from JSON

GOBL is a JSON format. So, you'll probably need to read or produce valid GOBL JSON at some point. Every struct class in the library provides a `.from_json!` and a `#to_json` method for those very purposes:

```ruby
json = '{"$schema":"https://gobl.org/draft-0/note/message", "content":"Hello World!"}'
document = GOBL::Schema::Object.from_json!(json) #=> #<GOBL::Schema::Object _value={"$schema"=>"https://gobl.org/draft-0/note/message", "content"=>"Hello World!"}>
message = document.extract #=> #<GOBL::Note::Message title=nil content="Hello World!" meta=nil>
message.content #=> "Hello World!"
```

Note that, in the previous example, we parsed the JSON fragment as a document. A [document](https://docs.gobl.org/core/documents) is one of the fundamental entities of GOBL, and it represents a business document in an abstract way. To get the specific document type instantiated –a message, in the example above–, we needed to call the [`#extract`](https://rubydoc.info/github/invopop/gobl.ruby/GOBL%2FExtensions%2FSchema%2FObjectHelper:extract) method of the document object.

The previous instantiation method is useful if you don't know the document type in advance. If you do, you could also instantiate the object in this more direct way:

```ruby
json = '{"$schema":"https://gobl.org/draft-0/note/message", "content":"Hello World!"}'
message = GOBL::Note::Message.from_json!(json) #=> #<GOBL::Note::Message title=nil content="Hello World!" meta=nil>
message.content #=> "Hello World!"
```

Conversely, you can generate JSON GOBL from any instantiated object:

```ruby
message = GOBL::Note::Message.new(content: 'Hello World!')
message.to_json #=> "{\"content\":\"Hello World!\"}"
```

Note that, in the previous example, the generated JSON doesn't include a `$schema` attribute. This is because the GOBL schema doesn't require that attribute in a standalone message structure. If you want to use that structure as a document, you will need a `$schema` to be present. You can get that from your Ruby code by simply [_embedding_](https://rubydoc.info/github/invopop/gobl.ruby/GOBL%2FExtensions%2FSchema%2FObjectHelper%2FClassMethods:embed) the struct in a document:

```ruby
message = GOBL::Note::Message.new(content: 'Hello World!')
document = GOBL::Schema::Object.embed(message)
document.to_json #=> "{\"content\":\"Hello World!\",\"$schema\":\"https://gobl.org/draft-0/note/message\"}"
```

_See also [`GOBL::Struct.from_json!`](https://rubydoc.info/github/invopop/gobl.ruby/GOBL%2FStruct%2Efrom_json!), [`GOBL::Struct#to_json`](https://rubydoc.info/github/invopop/gobl.ruby/GOBL%2FStruct:to_json), [`GOBL::Schema::Object#embed`](https://rubydoc.info/github/invopop/gobl.ruby/GOBL%2FExtensions%2FSchema%2FObjectHelper%2FClassMethods:embed), [`GOBL::Schema::Object.extract`](https://rubydoc.info/github/invopop/gobl.ruby/GOBL%2FExtensions%2FSchema%2FObjectHelper:extract)_

### Handling value objects and enumerations

You can instantiate value objects in the library from a Symbol, a String or something that can be coerced into one via `#to_s`:

```ruby
code = GOBL::Org::Code.new('A123') #=> #<GOBL::Org::Code _value="A123">
date = GOBL::Cal::Date.new(Date.today) #=> #<GOBL::Cal::Date _value="2022-09-23">
type = GOBL::Bill::InvoiceType.new(:credit_note) #=> #<GOBL::Bill::InvoiceType _value="credit-note">
```

Similarly, you can compare value objects to symbols, strings or any object coercible into one:

```ruby
GOBL::Org::Code.new('A123') == 'A123' #=> true
GOBL::Org::Code.new('2022-01-01') == Date.new(2022,1,1) #=> true
GOBL::Bill::InvoiceType.new('credit-note') == :credit_note #=> true
```

The GOBL schema uses composition with certain value objects to delimit the range of allowed values. For those enumerated types, the library provides additional convenience methods:

```ruby
# `.all` class method
GOBL::Bill::InvoiceType.all #=> Returns an array with all the objects in the enumeration

# Inquirers
type = GOBL::Bill::InvoiceType.new('credit-note')
type.proforma? #=> false
type.credit_note? #=> true

# Descriptions
type = GOBL::Org::Unit.new('kg')
type.description #=> "Metric kilograms"
```

_See also [`GOBL::Org::Code`](https://rubydoc.info/github/invopop/gobl.ruby/GOBL/Org/Code), [`GOBL::Bill::InvoiceType`](https://rubydoc.info/github/invopop/gobl.ruby/GOBL/Bill/InvoiceType)_

### Running operations

The library also provides an interface to run operations over GOBL structs in the GOBL CLI service. To run those operations, you'll need the [CLI installed][4] and the service running:

```shell
$ gobl serve -p 3033
```

Then, in your app, you need to configure the host and the port where the service is listening:

```ruby
GOBL.config.service_host = '127.0.0.1'
GOBL.config.service_port = 3033
```

And then you run your operations! For instance, you can build an invoice document, which will validate and calculate it:

```ruby
invoice = GOBL::Bill::Invoice.new(
  code: 'SAMPLE-001',
  currency: :eur,
  issue_date: Date.new(2021, 1, 1),
  supplier: { tax_id: { country: :es, code: '55105445K' }, name: 'Provide One S.L.' },
  customer: { tax_id: { country: :es, code: '65870696F' }, name: 'Sample Consumer' },
  lines: [{
    quantity: 20,
    item: { name: 'Development services', price: 90.0 },
    taxes: [ { cat: 'VAT', rate: :standard } ]
  }]
)
document = GOBL::Schema::Object.embed(invoice)
calculated_document = GOBL.build(document)
calculated_invoice = calculated_document.extract
calculated_invoice.totals.total_with_tax #=> "2178.00"
```

Note how the `#build` operation expects and returns either document or envelope structs. That's why we needed to embed our invoice in a document and extract the calculated invoice from the returned document. See the [operations API reference][5] for more details about this and the rest of the available operations.

_See also [`GOBL::Operations`][5]_

## Developer guide

### Project Structure

#### `lib`

Contains the `gobl` library components to be imported into other projects.

All the auto-generated files from the JSON schema are also defined here. You must not modify files containing an auto-generate header should not be modified. Under the hood, the gem uses `Zeitwerk` to load.

#### `tasks`

The tasks directory contains code able to parse (`tasks/parser`) GOBL JSON Schema and generate (`tasks/generators`) the Ruby versions of the GOBL structures.

### Development tasks

The project provides a `mage.go` file with a set of [Mage](https://magefile.org) tasks to be used by developers of the library. All these tasks run within a Docker container.

You can avoid mage and the docker container if you prefer so. Take a look at the `mage.go` file to learn the commands it invokes under the hood and run them yourself.

#### Installation

The command `mage setup` fetches and installs all the required dependencies to use the gem.

If you run into any problems with dependencies, don't forget this is a library, so the Gemfile.lock is not included. Delete any local versions you may already have and re-run.

#### Code generation

Ensure all the GOBL JSON Schema and Regime files are available by manually copying the [base GOBL project](https://github.com/invopop/gobl)'s `build/` path to the `data/` path in this repository. For example, assuming you have GOBL at `../gobl/`, you can run this:

```bash
rm -rf ./data/*
cp -r ../gobl/build/* ./data
```

Please note that `schemas` is _.gitignored_ as we only need it to generate the code. However, the previous command also copies `regimes` which content is used by the library and so, it is part of the git repo and the gem.

Now, with the help of [the GOBL generator](https://github.com/invopop/gobl.generator), you can regenerate the code. For example, assuming the GOBL generator is at `../gobl.generator`, you can run this:

```bash
rm -rf lib/generated/gobl
../gobl.generator/bin/generate -l ruby -o lib/generated/gobl/
```

#### Tests

Use the `mage spec` command to run the entire test suite.

#### Console

The command `mage console` spins up an IRB session with the library required.

#### YARD documentation

The library is fully documented using YARD. You can spin up a YARD server with the command `mage yardserver`.

[1]: https://www.rubydoc.info/gems/gobl
[2]: https://docs.gobl.org/
[3]: https://gobl.org/
[4]: https://github.com/invopop/gobl.cli
[5]: https://www.rubydoc.info/gems/gobl/GOBL/Operations
[6]: https://www.rubydoc.info/gems/gobl/index

### Releases

When releasing a new version of the GOBL Ruby library:

1.  Update lib/gobl/version.rb and commit the change (no need to push)
2.  Run `rake release` which generates the tag, pushes everything to github and rubygems
