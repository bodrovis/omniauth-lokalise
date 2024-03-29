# frozen_string_literal: true

require File.expand_path('lib/omniauth/lokalise/version', __dir__)

Gem::Specification.new do |spec|
  spec.name                  = 'omniauth-lokalise'
  spec.version               = OmniAuth::Lokalise::VERSION
  spec.authors               = ['Ilya Krukowski']
  spec.email                 = ['golosizpru@gmail.com']
  spec.summary               = 'Omniauth strategy for Lokalise'
  spec.description           = 'Official Omniauth (OAuth 2) strategy for Lokalise TMS'
  spec.homepage              = 'https://github.com/bodrovis/omniauth-lokalise'
  spec.license               = 'MIT'
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.5'

  spec.files = Dir['README.md', 'LICENSE',
                   'CHANGELOG.md', 'lib/**/*.rb',
                   'omniauth.gemspec', '.github/*.md',
                   'Gemfile', 'Rakefile']
  spec.extra_rdoc_files = ['README.md']
  spec.require_paths    = ['lib']

  spec.add_dependency 'omniauth', '~> 2.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.8'

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rubocop', '~> 1.6'
  spec.add_development_dependency 'rubocop-performance', '~> 1.5'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.0'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
