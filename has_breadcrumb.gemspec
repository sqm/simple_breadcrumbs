# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'has_breadcrumb/version'

Gem::Specification.new do |gem|
  gem.name          = "has_breadcrumb"
  gem.version       = HasBreadcrumb::VERSION
  gem.authors       = ["Squaremouth Engineering"]
  gem.email         = ["developers@squaremouth.com"]
  gem.description   = %q{Provide breadcrumb links.}
  gem.summary       = %q{Provide links for the current page in a breadcrumb format.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rails', '~> 3.1'
  gem.add_development_dependency 'rspec-rails'
  gem.add_development_dependency 'sqlite3'
end
