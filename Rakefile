# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task default: %w[lint spec]

task :lint do
  sh 'rubocop -A'
end

task :generate, %i[lang output_path] do |t, args|
  require_relative "tasks/generator"

  schema_path = "data/schemas"
  unless File.exists?(schema_path)
    puts "Schema path #{schema_path} does not exist"
    exit 1
  end

  lang = (args[:lang].presence || "ruby").to_sym
  output_path = args[:output_path] || "lib/#{lang}}"
  generator = Generator.new(path: schema_path, lang: lang)
  generator.export_to(output_path)
end

RSpec::Core::RakeTask.new('spec')
