# frozen_string_literal: true

require 'rspec/core/rake_task'

task default: %w[lint spec]

task compile: %w[generate format spec]

task :lint do
  sh 'rubocop -A'
end

task :generate do
  ruby 'bin/generate.rb'
end

task :format do
  sh ' rubocop --config lib/gobl/.rubocop.yml' \
     ' -A --only Layout,Style --fail-level W lib/gobl > /dev/null'
end

RSpec::Core::RakeTask.new('spec')
