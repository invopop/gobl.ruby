# frozen_string_literal: true

require_relative 'lib/gobl/version'

Gem::Specification.new do |spec|
  spec.name = 'gobl'
  spec.version = GOBL::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.summary = 'Minimalist ruby version of the GOBL library'
  spec.homepage = 'https://github.com/invopop/gobl.ruby'
  spec.license = 'Apache-2.0'
  spec.authors = ['David Lilue', 'Sam Lown', 'Juanjo Molinero']

  spec.required_ruby_version = '>= 2.7'
  spec.required_rubygems_version = '>= 3.1.4'

  spec.files = Dir['lib/**/*', 'data/regimes/**/*']
  spec.require_path = 'lib'

  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }

  spec.add_dependency('activesupport', '>= 4')
  spec.add_dependency('hashme', '>= 0.3.0')
  spec.add_dependency('zeitwerk', '>= 1')
end
