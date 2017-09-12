require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Matique < OmniAuth::Strategies::OAuth2
# AuthUrl = ENV["HEROKU_AUTH_URL"] || "https://id.heroku.com"
      AUTH_URL = ENV["AUTH_URL"] || 'http://localhost:3010'
#      AUTH_URL = 'https://login.matique.de'
      STRATEGY = 'matique'

      option :client_options, {
	site: AUTH_URL,
	authorize_url: "#{AUTH_URL}/auth/#{STRATEGY}/authorize",
	token_url: "#{AUTH_URL}/auth/#{STRATEGY}/access_token"
      }

      uid { raw_info['id'] }

      info do
	{ 'email' => raw_info['email'] }
      end

      extra do
	{ 'raw_info' => raw_info }
      end

      def raw_info
       @raw_info ||= access_token.get(
	 "/auth/matique/user.json?oauth_token=#{access_token.token}").
	 parsed || {}
      end

    end
  end
end
