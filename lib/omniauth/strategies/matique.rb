require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Matique < OmniAuth::Strategies::OAuth2

      option :client_options, {
	site: 'https://lvh.me',
	authorize_url: 'https//lvh.me/login/oauth/authorize',
	token_url: 'https://lvh.me/login/oauth/access_token'
      }




    end
  end
end
