require "test_helper"
require "omniauth-matique"

# based on omniauth-github, omniauth-clef and others

describe OmniAuth::Strategies::Matique do
  let(:strategy) { OmniAuth::Strategies::Matique.new({}) }
  let(:over) {
    OmniAuth::Strategies::Matique.new("KEY", "SECRET",
      client_options: {
        site: "S",
        authorize_url: "A",
        token_url: "T"
      })
  }

  it "Client has correct default client_options" do
    #    site = "https://login.matiq.com"
    site = "http://localhost:3010"
    assert_equal site.to_s, strategy.client.site
    assert_equal "#{site}/auth/matique/authorize",
      strategy.client.options[:authorize_url]
    assert_equal "#{site}/auth/matique/access_token",
      strategy.client.options[:token_url]
  end

  it "client options should be overwritable" do
    assert_equal "S", over.options.client_options.site
    assert_equal "A", over.options.client_options.authorize_url
    assert_equal "T", over.options.client_options.token_url
  end

  describe "raw_info" do
    def setup
      super
      @raw_info ||= {
        "email" => "test@example.com",
        "id" => "123"
      }
      strategy.stubs(:raw_info).returns(@raw_info)
    end

    it "uid returns the id from raw_info" do
      assert_equal "123", strategy.uid
    end

    it "access email from the raw_info" do
      assert_equal "test@example.com", strategy.info[:email]
      refute_nil strategy.extra[:raw_info]
    end
  end
end
