# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task default: %w[lint spec]

task :lint do
  sh 'rubocop -A'
end

RSpec::Core::RakeTask.new('spec')
