# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Lokalise < OmniAuth::Strategies::OAuth2
      option :name, 'lokalise'

      option :client_options, {
        site: 'https://app.lokalise.com',
        authorize_url: 'oauth2/auth',
        token_url: 'oauth2/token',
        grant_type: 'authorization_code'
      }

      uid { nil }

      info do
        {
          # :name => raw_info['name'],
          # :email => raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        # @raw_info ||= access_token.get('/me').parsed
        {}
      end
    end
  end
end
