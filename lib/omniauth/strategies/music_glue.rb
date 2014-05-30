require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class MusicGlue < OmniAuth::Strategies::OAuth2
      BaseAuthUrl = ENV["MUSIC_GLUE_AUTH_URL"] || "https://id.musicglue.com"

      option :client_options, {
        :site => BaseAuthUrl,
        :authorize_url => "#{BaseAuthUrl}/oauth/authorize",
        :token_url => "#{BaseAuthUrl}/oauth/token"
      }
    end
  end
end
