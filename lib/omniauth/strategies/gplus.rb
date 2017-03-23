require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class GPlus < OmniAuth::Strategies::OAuth2
      class NoAuthorizationCodeError < StandardError; end
      class UnknownSignatureAlgorithmError < NotImplementedError; end

      option :client_options,
             :site => 'https://www.googleapis.com/oauth2/v1',
             :authorize_url => 'https://www.google.com/accounts/o8/oauth2/authorization',
             :token_url => 'https://www.google.com/accounts/o8/oauth2/token'

      option :authorize_options, [:scope, :request_visible_actions]

      option :scope, 'userinfo.email'

      option :request_visible_actions, nil

      option :uid_field, :uid

      option :openid_realm

      uid { raw_info['id'] }

      info do
        {
          'email' => raw_info['email'],
          'name' => raw_info['name'],
          'first_name' => raw_info['given_name'],
          'last_name' => raw_info['family_name'],
          'image' => { 'url' => raw_info['picture'], 'is_default' => is_default },
          'urls' => {
            'Google+' => raw_info['link']
          }
        }
      end

      extra do
        {
          'locale' => raw_info['locale'],
          'gender' => raw_info['gender'],
          'birthday' => raw_info['birthday'],
          'raw_info' => raw_info
        }
      end

      def authorize_params
        super.tap do |params|
          params['scope'] = format_scopes(params['scope'])
          params['request_visible_actions'] = format_actions(params['request_visible_actions']) if params['request_visible_actions']
          custom_parameters(params)
          add_openid_realm_if_present(params)
        end
      end

      def callback_url
        full_host + script_name + callback_path
      end

      private

      def format_actions(actions)
        actions.split(/,\s*/).collect(&method(:format_action)).join(' ')
      end

      def format_action(action)
        "http://schemas.google.com/#{action}"
      end

      def format_scopes(scopes)
        scopes.split(/,\s*/).collect(&method(:format_scope)).join(' ')
      end

      def format_scope(scope)
        "https://www.googleapis.com/auth/#{scope}"
      end

      def custom_parameters(params)
        %w(scope client_options request_visible_actions access_type).each { |k| add_key_to_params(params, k) }
      end

      def add_key_to_params(params, key)
        params[key] = request.params[key] if request.params[key]
      end

      def add_openid_realm_if_present(params)
        realm = options.send(:openid_realm)
        params['openid.realm'] = realm if realm
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('userinfo').parsed
      end

      def is_default
        return @is_default if defined?(@is_default)

        url = File.join('https://www.googleapis.com/plus/v1/people', raw_info['id'])
        @is_default = access_token.get(url).parsed['image']['isDefault']
      end
    end
  end
end
