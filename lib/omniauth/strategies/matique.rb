require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Matique < OmniAuth::Strategies::OAuth2

# AuthUrl = ENV["HEROKU_AUTH_URL"] || "https://id.heroku.com"
#      SITE = 'https://login.matique.de'
      SITE = 'http://localhost:3010'
      STRATEGY = 'matique'

      option :client_options, {
	site: SITE,
	authorize_url: "#{SITE}/auth/#{STRATEGY}/authorize",
	token_url: "#{SITE}/auth/#{STRATEGY}/access_token"
      }

      uid { raw_info['id'] }

      info do
#       { 'email' => raw_info['info']['email'] }
       { 'email' => raw_info['email'] }
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
