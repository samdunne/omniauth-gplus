require 'omniauth-oauth2'
require_relative 'omniauth/strategies/gplus'
require_relative 'omniauth/gplus/version'

OmniAuth.config.add_camelization('gplus', 'GPlus')
