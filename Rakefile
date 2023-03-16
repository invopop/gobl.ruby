# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task default: %w[lint spec]

task :lint do
  sh 'rubocop -A'
end

task :generate do
  GENERATION_PATH = 'lib/generated/gobl'

  require_relative 'tasks/generator'

  generator = Generator.new(path: 'data/schemas', lang: 'ruby')

  sh "rm -rf #{GENERATION_PATH}"
  generator.export_to(GENERATION_PATH)
end

RSpec::Core::RakeTask.new('spec')
