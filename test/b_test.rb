require 'test_helper'
require 'omniauth-matique'

# based on omniauth-github, omniauth-clef and others

describe OmniAuth::Strategies::Matique do
  let(:strategy) { OmniAuth::Strategies::Matique.new({}) }

  it 'Client has correct default client_options' do
    assert_equal 'https://lvh.me', strategy.client.site
    assert_equal 'https://lvh.me/auth/matique/authorize',
	strategy.client.options[:authorize_url]
    assert_equal 'https://lvh.me/auth/matique/access_token',
	strategy.client.options[:token_url]
  end

end
