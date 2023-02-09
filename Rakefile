# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task default: %w[lint spec]

task :lint do
  sh 'rubocop -A'
end

task :generate, %i[lang output_path] do |t, args|
  require_relative "tasks/generator"
  generator = Generator.new(path: "data/schemas", lang: args[:lang].to_sym)
  generator.export_to(args[:output_path])
end

RSpec::Core::RakeTask.new('spec')
