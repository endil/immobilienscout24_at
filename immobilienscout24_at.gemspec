# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'immobilienscout24_at/version'

Gem::Specification.new do |s|
  s.name          = 'immobilienscout24_at'
  s.version       = Immobilienscout24At::VERSION
  s.authors       = ['Niels Richter']
  s.email         = ['niels@endil.de']
  s.description   = 'A Ruby interface for the ImmobilienScout24 Austria API'
  s.summary       = s.description
  s.homepage      = 'https://github.com/endil/immobilienscout24_at'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']
  
  s.add_dependency 'multi_json', '~> 1.3' # uri, net/https
end
