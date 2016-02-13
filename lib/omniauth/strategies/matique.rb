require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Matique < OmniAuth::Strategies::OAuth2

#      SITE = 'https://login.p.matique.de'
      SITE = 'login.lvh.me'
      STRATEGY = 'matique'

      option :client_options, {
	site: SITE,
	authorize_url: "/auth/#{STRATEGY}/authorize",
	token_url: "/auth/#{STRATEGY}/access_token"
      }

      uid { raw_info['id'] }

      info do
	{ 'email' => raw_info['info']['email'] }
      end

      extra do
	{ 'raw_info' => raw_info }
      end

      def raw_info
       @raw_info ||= access_token.get(
	 "/auth/#{STRATEGY}/info.json?oauth_token=#{access_token.token}").
	 parsed || {}
      end

    end
  end
end
