# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'schema_plus/association_inverses/version'

Gem::Specification.new do |spec|
  spec.name          = 'schema_plus_association_inverses'
  spec.version       = SchemaPlus::AssociationInverses::VERSION
  spec.authors       = ['Joel Low']
  spec.email         = ['joel@joelsplace.sg']

  if spec.respond_to?(:metadata)
  end

  spec.summary       = 'Warns when association inverses are not autodetected'
  spec.description   = ''
  spec.homepage      = 'https://github.com/lowjoel/schema_plus_association_inverses'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'schema_plus_core', '>= 0.3.1'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'rspec-core', '~> 3'
  spec.add_development_dependency 'schema_dev', '~> 3.3'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-gem-profile'
end
