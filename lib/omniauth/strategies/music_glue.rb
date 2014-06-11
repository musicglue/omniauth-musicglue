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
          :email => raw_info["email"],
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :session_nonce => raw_info['session_nonce']
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/me.json").parsed
      end
    end
  end
end
