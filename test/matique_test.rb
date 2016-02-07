require "minitest/autorun"
require 'omniauth'
require 'omniauth-matique'


describe OmniAuth::Strategies::Matique do
#  let(:access_token) { stub('AccessToken', :options => {}) }

  subject do
    OmniAuth::Strategies::Matique.new({})
  end

  before do
#    @meme = MiniTest::Mock.new
#    @meme_asker = MemeAsker.new @meme
  end

  describe "client options" do
    it 'should have correct site' do
assert_equal 'https://matique.de', subject.options.client_options.site
    end
  end

end
