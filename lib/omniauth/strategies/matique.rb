require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Matique < OmniAuth::Strategies::OAuth2
      SITE = 'https://login.p.matique.de'
      STRATEGY = 'matique'

      option :client_options, {
	site: SITE,
	authorize_url: "#{SITE}/auth/#{STRATEGY}/authorize",
	token_url: "#{SITE}/auth/#{STRATEGY}/access_token"
      }

      uid { raw_info['id'] }

      info do
	{ 'email' => raw_info['email'] }
      end

      extra do
	{ 'raw_info' => raw_info }
      end

      def raw_info
	@raw_info ||= access_token.get('info').parsed || {}
      end

    end
  end
end
