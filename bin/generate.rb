# frozen_string_literal: true

require 'active_support'
require_relative '../app/generator'

generator = Generator.new(path: 'data/schemas', lang: 'ruby')
generator.export_to('lib/gobl')
