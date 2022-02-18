# frozen_string_literal: true

require 'rspec/core/rake_task'

task default: %w[lint spec]

task :lint do
  sh 'rubocop -A'
end

task :generate do
  ruby 'bin/generate.rb'
end

RSpec::Core::RakeTask.new('spec')
