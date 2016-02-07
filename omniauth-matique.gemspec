require File.expand_path('../lib/omniauth-matique/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dittmar Krall"]
  gem.email         = ["dittmar.krall@matique.de"]
  gem.description   = %q{OmniAuth strategy for Matique.}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/matique/omniauth-matique"
  gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-matique"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Matique::VERSION

  gem.add_dependency 'omniauth'
  gem.add_dependency 'omniauth-oauth2'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'rake'
end
