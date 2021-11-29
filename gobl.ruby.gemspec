# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'gobl.ruby'
  spec.version = '0.1.0'
  spec.platform = Gem::Platform::RUBY
  spec.summary = 'Minimalist ruby version of the GOBL library'
  spec.files =
    Dir.glob('lib/**/*') +
    Dir.glob('schema/**/*') +
    %w[Gemfile] +
    ['gobl.ruby.gemspec']
  spec.require_path = 'lib'
  spec.required_ruby_version = '>= 2.7'
  spec.required_rubygems_version = '>= 3.1.4'

  spec.authors = ['David Lilue', 'Sam Lown', 'Juanjo Molinero']

  spec.add_dependency('dry-struct', '~> 1.4.0')
  spec.add_dependency('dry-types', '~> 1.5.1')
  spec.add_dependency('json', '~> 2.6.1')
  spec.add_dependency('json-schema', '~> 2.8.1')
  spec.add_dependency('zeitwerk', '~> 2.5.1')

  spec.add_development_dependency('rspec', '~> 3.10')
  spec.add_development_dependency('rubocop', '~> 1.20')
  spec.add_development_dependency('rubocop-performance', '~> 1.11.5')
  spec.add_development_dependency('rubocop-rspec', '~> 2.4.0')
  spec.homepage = 'https://github.com/invopop/gobl.ruby'
  spec.description = 'Minimalist ruby version of the GOBL library'
  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end
