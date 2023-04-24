lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth-matique/version"

Gem::Specification.new do |s|
  s.name = "omniauth-matique"
  s.version = OmniAuth::Matique::VERSION
  s.summary = "OmniAuth strategy for matiq"
  s.description = <<-END
    Strategy to authenticate with matiq UG (haftungsbeschränkt)
    via OAuth2 in OmniAuth.
  END
  s.authors = ["Dittmar Krall"]
  s.email = ["dittmar.krall@matiq.com"]
  s.homepage = "https://github.com/matique/omniauth-matique"

  s.license = "MIT"
  s.platform = Gem::Platform::RUBY

  s.metadata["source_code_uri"] = "https://github.com/matique/omniauth-matique"

  s.files = `git ls-files -z`.split("\x0")
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake", "~> 13"
  s.add_dependency "omniauth-oauth2", "~> 1"

  s.add_development_dependency "minitest", "~> 5"
  s.add_development_dependency "mocha", "~> 1"
end
