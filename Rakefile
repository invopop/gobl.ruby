# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task default: %w[lint spec]

task :lint do
  sh 'rubocop -A'
end

task :generate do
  require_relative 'tasks/generator'

  generator = Generator.new(path: 'data/schemas', lang: 'ruby')
  generator.export_to('lib/gobl')
end

RSpec::Core::RakeTask.new('spec')
