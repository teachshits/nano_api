# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'nano_api/version'

Gem::Specification.new do |s|
  s.name        = 'nano_api'
  s.version     = NanoApi::VERSION
  s.authors     = ['Alexander Stanko']
  s.email       = ['astanko@aviasales.ru']
  s.homepage    = ''
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = 'nano_api'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'rails', '~> 3.1.3'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'jasmine'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'fakeweb'

  s.add_runtime_dependency 'rest-client'
end
