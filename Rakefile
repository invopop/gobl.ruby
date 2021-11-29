# frozen_string_literal: true

require 'rspec/core/rake_task'

task default: %w[generate rubocop spec]

task :generate do
  ruby 'bin/generate.rb'
end

task :rubocop do
  sh 'rubocop -A > /dev/null'
end

RSpec::Core::RakeTask.new('spec')
