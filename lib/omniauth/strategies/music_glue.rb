require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      BaseAuthUrl = ENV["MUSIC_GLUE_AUTH_URL"] || "https://id.musicglue.com"

      # change the class name and the :name option to match your application name
      option :name, :doorkeeper

      option :client_options, {
        :site => BaseAuthUrl,
        :authorize_url => "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"]
          # and anything else you want to return to your API consumers
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/me.json').parsed
      end
    end
  end
end
