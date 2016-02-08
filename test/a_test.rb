require 'test_helper'
require 'omniauth-matique'

# based on omniauth-github, omniauth-clef and others

class StrategyTest < StrategyTestCase
  include OAuth2StrategyTests
end

class UidTest < StrategyTestCase
  def setup
    super
    strategy.stubs(:raw_info).returns({ 'id' => '123' })
  end

  test 'returns the id from raw_info' do
    assert_equal '123', strategy.uid
  end
end

class InfoTestOptionalDataPresent < StrategyTestCase
  def setup
    super
    @raw_info ||= { 'email' => 'test@example.com' }
    strategy.stubs(:raw_info).returns(@raw_info)
  end

  test 'returns the email' do
    assert_equal 'test@example.com', strategy.info['email']
  end
end

describe OmniAuth::Strategies::Matique do
  let(:over) do
    OmniAuth::Strategies::Matique.new('KEY', 'SECRET',
      {
	client_options: {
	  site: 'S',
	  authorize_url: 'A',
	  token_url: 'T'
	}
      }
    )
  end

  describe "client options" do
    it "should be overwritable" do
      assert_equal 'S', over.options.client_options.site
      assert_equal 'A', over.options.client_options.authorize_url
      assert_equal 'T', over.options.client_options.token_url
    end
  end
end

class RawInfoTest < StrategyTestCase
  def setup
    super
    @access_token = stub('OAuth2::AccessToken')
  end

  test 'performs a GET to https://lvh.me' do
    strategy.stubs(:access_token).returns(@access_token)
    @access_token.expects(:get).with('info').
      returns(stub_everything('OAuth2::Response'))
    strategy.raw_info
  end

  test 'returns a Hash' do
    strategy.stubs(:access_token).returns(@access_token)
    raw_response = stub('Faraday::Response')
    raw_response.stubs(:body).returns('{ "ohai": "thar" }')
    raw_response.stubs(:status).returns(200)
    raw_response.stubs(:headers).returns({'Content-Type' => 'application/json' })
    oauth2_response = OAuth2::Response.new(raw_response)
    @access_token.stubs(:get).with('info').returns(oauth2_response)
    assert_kind_of Hash, strategy.raw_info
    assert_equal 'thar', strategy.raw_info['ohai']
  end

  test 'returns an empty hash when the response is false' do
    strategy.stubs(:access_token).returns(@access_token)
    oauth2_response = stub('OAuth2::Response', :parsed => false)
    @access_token.stubs(:get).with('info').returns(oauth2_response)
    assert_kind_of Hash, strategy.raw_info
  end
end
