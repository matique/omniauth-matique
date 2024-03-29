if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start do
    add_filter "/test/"
  end
end

require "bundler/setup"
require "minitest/autorun"
require "mocha/minitest"
require "omniauth/strategies/matique"

OmniAuth.config.test_mode = true

def assert_has_key(key, hash, msg = nil)
  msg = message(msg) { "Expected #{hash.inspect} to have key #{key.inspect}" }
  assert hash.has_key?(key), msg
end

def refute_has_key(key, hash, msg = nil)
  msg = message(msg) { "Expected #{hash.inspect} not to have key #{key.inspect}" }
  refute hash.has_key?(key), msg
end
