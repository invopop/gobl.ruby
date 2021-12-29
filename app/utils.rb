# frozen_string_literal: true

# Utils - Module with useful common methods.
module Utils
  # Returns the JSON schema definition for a given URI. Stripping the
  # prefix.
  def strip_definition(definition)
    %r{#/definitions/(.*)} =~ definition

    Regexp.last_match(1)
  end
end
