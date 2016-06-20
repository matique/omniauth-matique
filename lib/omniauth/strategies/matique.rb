require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Matique < OmniAuth::Strategies::OAuth2
#      SITE = 'https://lvh.me'
#      SITE = 'https://login.matique.de'
      SITE = 'http://localhost:3010'

      option :client_options, {
	site: SITE,
	authorize_url: "#{SITE}/auth/matique/authorize",
	token_url: "#{SITE}/auth/matique/access_token"
      }

      uid { raw_info['id'] }

      info do
	{ 'email' => raw_info['email'] }
      end

      extra do
	{ 'raw_info' => raw_info }
      end

      def raw_info
#        @raw_info ||= access_token.get('info').parsed || {}
       @raw_info ||= access_token.get(
 "/auth/matique/user.json?oauth_token=#{access_token.token}").parsed || {}
      end

    end
  end
end
