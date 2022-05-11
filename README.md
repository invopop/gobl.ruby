# GOBL Ruby

<img src="https://github.com/invopop/gobl/blob/main/gobl_logo_black_rgb.svg?raw=true" width="181" height="219" alt="GOBL Logo">

Go Business Language - Ruby.

Released under the Apache 2.0 [LICENSE](https://github.com/invopop/gobl/blob/main/LICENSE), Copyright 2021,2022 [Invopop Ltd.](https://invopop.com). Trademark pending.

## Introduction

Ruby version of the GOBL library that can be used for reading previously generated documents.

Included is an application that will convert GOBL JSON Schema into Ruby models ready for use in applications.

## Installation

```
gem 'gobl', git: 'https://github.com/invopop/gobl.ruby', branch: 'main'
```

## Project Structure

### `schema`

Copy of the current GOBL schema data.

### `lib`

Contains the `gobl` library components to be imported into other projects.

All the auto-generated files from the JSON schema are defined here. Files containing an auto-generate header should not be modified. Under the hood, the gem uses `Zeitwerk` to load.

### `app`

The app directory contains an application used to generate the Ruby versions of the GOBL JSON Schema structures.

The `app/catalog` contains a useful structure to handle the schemas, names and relations among the GOBL objects. It is used by the generator and loader.

The `app/generator` defines all the structures to generate the gem. The
`Generator::Exporter` and `Generator::Renderer` are core structures to
auto-generate, render and export Ruby object into files.

### `bin`

Basic gem usage commands are defined in here.

## Development

### Installation

The command `mage install` gets the required dependencies to use the gem.

### Compilation

The command `mage generate` generates the Ruby files from the JSON Schema. If
the schema is updated, the command will update the Ruby files.

## Tests

Run `mage spec` to ensure the basics are working.

## Example

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
