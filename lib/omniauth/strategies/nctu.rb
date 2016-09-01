require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class NCTU < OmniAuth::Strategies::OAuth2
      OAuthUrl = "https://id.nctu.edu.tw"

      option :name, "nctu"

      option :client_options, {
        site:           OAuthUrl,
        authorize_url:  "#{OAuthUrl}/o/authorize/",
        token_url:      "#{OAuthUrl}/o/token"
      }

      uid { raw_info["username"] }

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
         @raw_info ||= access_token.get("api/profile/").parsed
       end
    end
  end
end

