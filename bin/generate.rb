# frozen_string_literal: true

require_relative '../lib/generator'

generator = Generator.new(schema_dir: 'schema', lang: 'ruby')

generator.inflect(
  'gobl' => 'GOBL',
  'uuid' => 'UUID',
  'url' => 'URL'
)

generator.export_to('lib')
