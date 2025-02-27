# frozen_string_literal: true

require_relative 'lib/rest_client/version'

Gem::Specification.new do |s|
  s.name        = 'rest-client'
  s.version     = RestClient::VERSION
  s.authors     = ['REST Client Team']
  s.email       = 'discuss@rest-client.groups.io'
  s.homepage    = 'https://github.com/rest-client/rest-client'
  s.summary     = 'Simple HTTP and REST client for Ruby, inspired by microframework syntax for specifying actions.'
  s.description = 'A simple HTTP and REST client for Ruby, inspired by the Sinatra microframework style of specifying actions: get, put, post, delete.'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 2.0.0'

  s.files      = `git ls-files -z`.split("\0")
  s.test_files = `git ls-files -z spec/`.split("\0")

  s.bindir      = 'exe'
  s.executables = ['restclient']

  s.extra_rdoc_files = ['README.md', 'history.md']

  s.add_development_dependency('pry', '~> 0')
  s.add_development_dependency('pry-doc', '~> 0')
  s.add_development_dependency('rake', '~> 0')
  s.add_development_dependency('rdoc', '>= 2.4.2', '< 6.0')
  s.add_development_dependency('rspec', '~> 3.0')
  s.add_development_dependency('rubocop', '~> 0.49')
  s.add_development_dependency('simplecov')
  s.add_development_dependency('webmock', '~> 2.0')

  s.add_runtime_dependency('http-accept', '>= 1.7.0', '< 3.0')
  s.add_runtime_dependency('http-cookie', '>= 1.0.2', '< 2.0')
  s.add_runtime_dependency('mini_mime', '>= 0.1.1')
  s.add_runtime_dependency('netrc', '~> 0.8')
  s.add_runtime_dependency('zeitwerk')

  # ffi is needed for RestClient::Windows::RootCerts
  case RUBY_PLATFORM
  when /(mingw32|mswin32|x64-mingw)/
    # ffi is needed for RestClient::Windows::RootCerts
    s.add_runtime_dependency('ffi', '~> 1.9')
    s.platform = RUBY_PLATFORM
  end
end
