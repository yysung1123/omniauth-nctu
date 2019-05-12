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

      uid do
        raw_info["username"]
      end

      info do
        {
          :email => raw_info["email"],
          :name => raw_info["username"],
          :image => "http://museum.lib.nctu.edu.tw/share/mark.gif"
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
        options[:redirect_uri] || full_host + script_name + callback_path
      end

    end
  end
end

