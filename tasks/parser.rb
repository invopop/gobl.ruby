# frozen_string_literal: true

require_relative 'parser/id'
require_relative 'parser/loader'
require_relative 'parser/composition'
require_relative 'parser/schema'
require_relative 'parser/type'

# Easily load and build schemas from source files.
module Parser
  def self.load(path)
    Loader.new(path)
  end
end
