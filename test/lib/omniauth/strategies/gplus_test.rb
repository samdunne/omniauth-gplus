require 'helper'
require 'mocha/setup'

class TestOmniAuthGPlus < MiniTest::Unit::TestCase
  def setup
    @request = mock('Request')
    @request.stubs(:params).returns({})
    @request.stubs(:cookies).returns({})
    @request.stubs(:env).returns({})

    @client_id = '123'
    @client_secret = '53cr3tz'
  end

  def test_site_is_valid
    expected = 'https://www.googleapis.com/oauth2/v1'
    actual = strategy.client.site
    assert_equal(expected, actual)
  end

  def test_authoirze_url_is_valid
    expected = 'https://www.google.com/accounts/o8/oauth2/authorization'
    actual = strategy.options.client_options.authorize_url
    assert_equal(expected, actual)
  end

  def test_token_url_is_valid
    expected = 'https://www.google.com/accounts/o8/oauth2/token'
    actual = strategy.options.client_options.token_url
    assert_equal(expected, actual)
  end

  def test_default_scope_is_email
    expected = 'userinfo.email'
    actual = strategy.options['scope']
    assert_equal(expected, actual)
  end

  def test_that_it_has_a_version_number
    refute_nil OmniAuth::GPlus::VERSION
  end

  def new_oauth
    OmniAuth::Strategies::GPlus.new(application)
  end

  def test_has_uid
    expected = :uid
    actual = new_oauth.options.uid_field
    assert_equal(expected, actual)
  end
  
  def test_uid_not_nil
    refute_nil(new_oauth.options.uid_field)
  end
end
