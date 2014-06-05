require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class MusicGlue < OmniAuth::Strategies::OAuth2
      BaseAuthUrl = ENV["MUSIC_GLUE_AUTH_URL"] || "https://id.musicglue.com"

      # change the class name and the :name option to match your application name
      option :name, :music_glue

      option :client_options, {
        :site => BaseAuthUrl,
        :authorize_url => "/oauth/authorize"
      }

      uid { raw_info["user_id"] }

      info do
        {
          :email => raw_info["email"]
          :first_name => raw_info['first_name']
          :last_name => raw_info['last_name']
          # and anything else you want to return to your API consumers
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/me.json").parsed
      end
    end
  end
end
