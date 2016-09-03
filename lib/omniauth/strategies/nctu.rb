require "omniauth-oauth2"
require "oauth2"

module OmniAuth
  module Strategies
    class Nctu < OmniAuth::Strategies::OAuth2
      OAuthUrl = "https://id.nctu.edu.tw"

      option :name, "nctu"

      option :client_options, {
        site:           OAuthUrl,
        authorize_url:  "#{OAuthUrl}/o/authorize/",
        token_url:      "#{OAuthUrl}/o/token/"
      }

      info do
        {
          :username => raw_info["username"],
          :d2_email => raw_info["d2_email"]
        }
      end

      extra do
        {
          "raw_info" => raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :header
        @raw_info ||= access_token.get("/api/profile/").parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end

    end
  end
end

