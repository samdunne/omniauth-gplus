module OmniAuth
  module Strategies
    class GPlus < OAuth2
      option :client_options, {
        site: 'https://www.googleapis.com/oauth2/v1',
        authorize_url: 'https://www.google.com/accounts/o8/oauth2/authorization',
        token_url: 'https://www.google.com/accounts/o8/oauth2/token'
      }

      option :scope, 'email'

      option :uid_field, :uid

      info do
        binding.pry
        {
          'email' => raw_info['email'],
          'name' => raw_info['name'],
          'first_name' => raw_info['given_name'],
          'last_name' => raw_info['family_name'],
          'image' => raw_info['picture'],
          'urls' => {
            "Google+" => raw_info['link']
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
          custom_parameters(params)
        end
      end

      private

      def format_scopes(scopes)
        scopes.split(/,\s*/).map(&method(:format_scope)).join(" ")
      end

      def format_scope(scope)
        "https://www.googleapis.com/auth/userinfo.#{scope}"
      end

      def custom_parameters(params)
        ["scope", "client_options"].each { |k| add_key_to_params(params, k) }
      end

      def add_key_to_params(params, key)
        params[key] = request.params[key] if request.params[key]
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('userinfo').parsed
      end
    end
  end
end
