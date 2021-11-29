# frozen_string_literal: true

require_relative '../lib/dynamic/generator'

generator = Dynamic::Generator.new(schema_dir: 'schema', lang: 'ruby')

generator.inflect(
  'gobl' => 'GOBL',
  'uuid' => 'UUID',
  'url' => 'URL'
)

generator.export_to('lib')
