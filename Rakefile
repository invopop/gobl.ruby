# frozen_string_literal: true

task default: %w[generate rubocop]

task :rubocop do
  sh 'rubocop -A > /dev/null'
end

task :generate do
  ruby 'bin/generate.rb'
end
