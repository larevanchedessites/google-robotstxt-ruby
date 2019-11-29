# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'google_robotstxt_parser/version'

Gem::Specification.new do |s|
  s.name        = 'google_robotstxt_parser'
  s.version     = GoogleRobotstxtParser::VERSION
  s.date        = '2019-11-25'
  s.summary     = 'Ruby gem wrapper around Google Robotstxt Parser library'
  s.description = 'This is a unofficial Ruby gem that provides a wrapper around [Google Robotstxt Parser C++ library]'
  s.authors     = ['Bastien Montois']
  s.email       = 'bastien.montois@la-revanche-des-sites.fr'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = 'https://github.com/larevanchedessites/google-robotstxt-ruby'
  s.license     = 'MIT'

  s.require_paths = %w[lib ext]
  s.extensions = ['ext/robotstxt/extconf.rb']

  s.add_development_dependency 'bundler', '~> 2.0'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rake-compiler', '~> 1.0'

  s.add_development_dependency 'guard-rspec', '~> 4.7'
  s.add_development_dependency 'rspec', '~> 3.0'
end
