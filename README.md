# gobl.ruby
Minimalist ruby version of the GOBL library.

# Gem structure

## `schema`

This directory has the only purpose of having a local version of the GoBL JSON
schema definition.

## `lib`

Gem's core structures are defined in this directory, also the auto-generated
ones.

### `lib/gobl`

All the auto-generated files are defined here. Nothing shouldn't be edited, or
alter, manually.

### `lib/catalog`

The `Catalog` is a useful structure to handle the schemas, names and
relations among the GoBL objects. It is used by the generator and loader.

### `lib/generator`

This class defines all the structures to generate the gem. The
`Generator::Exporter` and `Generator::Renderer` are core structures to
auto-generate, render and export Ruby object into files.

### `lib/loader`

This class defines all the structures to load the gem, using internally the gem
`Zeitwerk`. Also, it uses the `Catalog` to patch the auto-generated classes
with additional data of the original schema.

## `bin`

Basic gem usage commands are defined in here.

# Installation

The command `mage install` gets the required dependencies to use the gem.

# Compilation

The command `mage generate` generates the Ruby files from the JSON Schema. If
the schema is updated, the command will update the Ruby files.

# Example

Example class instantiation from data object

```ruby
GOBL::Bill::Invoice.new({
  uuid: 'fb3ad823-65fe-4a15-beff-7dfb186c7b29',

  # ...,

  totals: {
    sum: '222',
    payable: '222',
  },
  rates: [
    { currency: 'foo', value: '7.0' },
    { currency: 'bar', value: '9.0' },
  ],
})
```
