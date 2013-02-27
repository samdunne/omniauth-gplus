require 'omniauth-gplus'
require 'minitest/autorun'
require 'minitest/pride'

OmniAuth.config.test_mode = true

def application
  ->(env) { [200, {}, ["Hello World."]]}
end

def strategy
  @strategy ||= begin
    OmniAuth::Strategies::GPlus.new(nil, *strategy_arguments).tap do |strategy|
      strategy.stubs(:request).returns(@request)
    end
  end
end

def strategy_arguments
  [@client_id, @client_secret, @options].compact
end
