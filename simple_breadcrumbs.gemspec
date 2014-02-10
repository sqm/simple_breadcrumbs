# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'has_breadcrumb/version'

Gem::Specification.new do |gem|
  gem.name          = "simple_breadcrumbs"
  gem.version       = HasBreadcrumb::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Tim Harvey", "Matt Outten"]
  gem.email         = ["developers@squaremouth.com"]
  gem.description   = %q{Provides a simple and flexible way to create breadcrumbs with Rails active record models.}
  gem.summary       = %q{Setting has_breadcrumb on a model will enable a view method, breadcrumb(), which will show the links to the page and its parents in a breadcrumb format.}
  gem.homepage      = "https://github.com/sqm/simple_breadcrumbs"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'activerecord', ['>= 3.0', '< 5.0']
  gem.add_dependency 'activesupport', ['>= 3.0', '< 5.0']

  gem.add_development_dependency 'rspec-rails', '~> 2.13'
  gem.add_development_dependency 'sqlite3', '~> 1.3'
end
