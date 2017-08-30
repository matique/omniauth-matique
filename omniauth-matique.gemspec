lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-matique/version'

Gem::Specification.new do |s|
  s.name          = 'omniauth-matique'
  s.version       = OmniAuth::Matique::VERSION
  s.summary       = 'OmniAuth strategy for matique'
  s.description   = <<-'END'
    Strategy to authenticate with matique UG via OAuth2 in OmniAuth.
  END
  s.authors       = ['Dittmar Krall']
  s.email         = ['dittmar.krall@matique.de']
  s.homepage      = 'https://github.com/matique/omniauth-matique'

  s.license       = 'MIT'
  s.platform      = Gem::Platform::RUBY

  s.files         = `git ls-files -z`.split("\x0")
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1'
  s.add_development_dependency 'rake', '~> 12'
  s.add_dependency 'omniauth-oauth2', '~> 1'
end
