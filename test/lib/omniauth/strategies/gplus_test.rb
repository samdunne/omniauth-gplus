require 'helper'
require 'mocha/setup'

# Test class for omniauth-gplus
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

  def test_default_request_visible_actions_is_nil
    expected = nil
    actual = strategy.options['request_visible_actions']
    assert_equal(expected, actual)
  end

  def test_state_state_is_not_included_in_request_params_when_present
    expected = 'some_state'
    @request.stubs(:params).returns('state' => expected)
    refute_equal expected, strategy.authorize_params[:state]
  end

  def test_do_not_store_state_in_the_session_when_present
    expected = 'some_state'
    @request.stubs(:params).returns('state' => expected)
    refute_empty strategy.authorize_params['state']
    refute_equal expected, strategy.authorize_params[:state]
    refute_empty strategy.session['omniauth.state']
    refute_equal expected, strategy.session['omniauth.state']
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
