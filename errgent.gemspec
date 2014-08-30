Gem::Specification.new do |spec|
  spec.name          = 'errgent'
  spec.version       = '2.0.0'
  spec.authors       = 'Dmitry Vorotilin'
  spec.email         = 'd.vorotilin@gmail.com'
  spec.summary       = 'Error pages generator'
  spec.description   = 'Generate error pages for Rails applications'
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
