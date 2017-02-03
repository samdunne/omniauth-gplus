omniauth-gplus
=========

[![Gem Version](http://img.shields.io/gem/v/omniauth-gplus.svg)][gem]
[![Code Climate](http://img.shields.io/codeclimate/github/samdunne/omniauth-gplus.svg)][codeclimate]
[![Build Status](http://img.shields.io/travis/samdunne/omniauth-gplus.svg)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/samdunne/omniauth-gplus.svg)][gemnasium]
[![Gittip](http://img.shields.io/gittip/samdunne_.svg)][gittip]

[gem]: https://rubygems.org/gems/omniauth-gplus
[codeclimate]: https://codeclimate.com/github/samdunne/omniauth-gplus
[travis]: https://travis-ci.org/samdunne/omniauth-gplus
[gemnasium]: https://gemnasium.com/samdunne/omniauth-gplus
[gittip]: https://www.gittip.com/samdunne_

`omniauth-gplus` is a Google+ strategy for OmniAuth.
It allows you to easily interact with the Google+ OAuth2 endpoint.


Installing
----------

**Requirements**:
  A GPlus API key/secret

You can either install manually:

``` bash
$ gem install omniauth-gplus
```

Or put it in your `Gemfile`:

``` ruby
source 'https://rubygems.org'

gem 'omniauth-gplus', '~> 2.0'
```


Examples
--------

To use `omniauth-gplus` in Rails you only need to put this in a initializer:

``` ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :gplus, ENV['GPLUS_KEY'], ENV['GPLUS_SECRET']
end
```

By default the gem uses the `userinfo.email` scope, but you can get more information by using this interface:

``` ruby
provider :gplus, ENV['GPLUS_KEY'], ENV['GPLUS_SECRET'], scope: 'userinfo.email, userinfo.profile'
```

Here are the different scopes:

  - https://www.googleapis.com/auth/userinfo.email
  - https://www.googleapis.com/auth/userinfo.profile

To identify the user as "me" in all requests use this scope:

  - https://www.googleapis.com/auth/plus.me

To get all of these AND log the user in:

  - https://www.googleapis.com/auth/plus.login

If you use the `plus.login` scope you can request `visibleactions` in order to allow your app to post App Activities on behalf of your users.  To request `visibleactions`, use the following interface:

```ruby
provider :gplus, ENV['GPLUS_KEY'], ENV['GPLUS_SECRET'], scope: 'plus.login', request_visible_actions: 'AddActivity,BuyActivity'
```

To see and learn about all of the available App Activity types, visit: https://developers.google.com/+/web/api/rest/latest/activities

To get a refresh token please pass the following:

```ruby
provider :gplus, ENV['GPLUS_KEY'], ENV['GPLUS_SECRET'], scope: 'plus.login', request_visible_actions: 'AddActivity,BuyActivity', access_type: 'offline'
```

The information schema looks like this:

``` ruby
info do
  {
    'email' => 'sam@sam-dunne.com',
    'name' => 'Sam Dunne',
    'first_name' => 'Sam',
    'last_name' => 'Dunne',
    'image' => 'http://somelongurl.png',
    'urls' => {
      "Google+" => 'http://urltouserprofile.com'
    }
  }
end

extra do
  {
    'locale' => 'en',
    'gender' => 'male',
    'birthday' => '2013-12-24',
    'raw_info' => # huge hash
  }
end
```

Supported Rubies
----------------
Actively tested with the following Ruby versions:
- MRI 2.1.0
- MRI 2.0.0
- MRI 1.9.3
- MRI 1.9.2
- JRuby HEAD
- JRuby 1.9
- Rubinius (latest stable)


License
-------

Copyright (c) 2014 Sam Dunne

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
