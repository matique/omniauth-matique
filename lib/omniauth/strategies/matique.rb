require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Matique < OmniAuth::Strategies::OAuth2
      SITE = 'https://lvh.me'

      option :client_options, {
	site: SITE,
	authorize_url: "#{SITE}/auth/matique/authorize",
	token_url: "#{SITE}/auth/matique/access_token"
      }

      uid { raw_info['id'] }

      info do
#        { 'email' => raw_info['info']['email'] }
	{ 'email' => raw_info['email'] }
      end

      extra do
	{ 'raw_info' => raw_info }
      end

      def raw_info
p 1111111111111111111
#        @raw_info ||= access_token.get(
#          "/auth/sso/user.json?oauth_token=#{access_token.token}").parsed
	@raw_info ||= access_token.get('info').parsed || {}
	@raw_info = @raw_info['info'] if !@raw_info['info'].nil?
	@raw_info
      end

    end
  end
end
