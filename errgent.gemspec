# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'errgent/version'

Gem::Specification.new do |spec|
  spec.name          = 'errgent'
  spec.version       = Errgent::VERSION
  spec.authors       = 'Dmitry Vorotilin'
  spec.email         = 'd.vorotilin@gmail.com'
  spec.description   = 'Errgent generates error pages for your Rails application'
  spec.summary       = 'Error pages generator'
  spec.homepage      = 'https://github.com/route/errgent'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'railties', '>= 3.0'
  spec.add_runtime_dependency 'actionpack', '>= 3.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'minitest', '~> 4.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'tzinfo'
end
