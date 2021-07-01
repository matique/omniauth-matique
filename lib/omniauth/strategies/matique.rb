# frozen_string_literal: true

require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Matique < OmniAuth::Strategies::OAuth2
      # AUTH_URL = 'https://login.matique.de'
      AUTH_URL = ENV["AUTH_URL"] || "http://localhost:3010"
      STRATEGY = "matique"

      option :client_options, {
        site: AUTH_URL,
        authorize_url: "#{AUTH_URL}/auth/#{STRATEGY}/authorize",
        token_url: "#{AUTH_URL}/auth/#{STRATEGY}/access_token"
      }

      uid { raw_info["id"].to_s }

      info do
        {
          name: raw_info["name"],
          username: raw_info["username"],
          email: raw_info["email"],
          image: raw_info["avatar_url"]
        }
      end

      extra do
        {raw_info: raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get(
          "/auth/matique/user.json?oauth_token=#{access_token.token}"
        ).parsed || {}
      end
    end
  end
end
