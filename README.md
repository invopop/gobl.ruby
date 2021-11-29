# gobl.ruby
Minimalist ruby version of the GOBL library.

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
