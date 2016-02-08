# inspired by omniauth-github, omniauth-clef and others

require 'test_helper'
require 'omniauth-matique'

class StrategyTest < StrategyTestCase
  include OAuth2StrategyTests
end

describe OmniAuth::Strategies::Matique, 'raw_info test' do
  let(:strategy) { OmniAuth::Strategies::Matique.new({}) }

  def setup
    @access_token = stub('OAuth2::AccessToken')
    strategy.stubs(:access_token).returns(@access_token)
  end

  it 'performs a GET to https://lvh.me' do
    @access_token.expects(:get).with('info').
      returns(stub_everything('OAuth2::Response'))
    strategy.raw_info
  end

  it 'returns a Hash' do
    raw_response = stub('Faraday::Response')
    raw_response.stubs(:body).returns('{ "ohai": "thar" }')
    raw_response.stubs(:status).returns(200)
    raw_response.stubs(:headers).returns({'Content-Type' => 'application/json' })
    oauth2_response = OAuth2::Response.new(raw_response)
    @access_token.stubs(:get).with('info').returns(oauth2_response)
    assert_kind_of Hash, strategy.raw_info
    assert_equal 'thar', strategy.raw_info['ohai']
  end

  it 'returns an empty hash when the response is false' do
    oauth2_response = stub('OAuth2::Response', :parsed => false)
    @access_token.stubs(:get).with('info').returns(oauth2_response)
    assert_kind_of Hash, strategy.raw_info
  end

end
