omniauth-gplus
=========

  - [![Gem Version](https://badge.fury.io/rb/omniauth-gplus.png)](https://rubygems.org/gems/omniauth-gplus)
  - [![Code Climate](https://codeclimate.com/github/krainboltgreene/omniauth-gplus.png)](https://codeclimate.com/github/krainboltgreene/omniauth-gplus)
  - [![Build Status](https://travis-ci.org/krainboltgreene/omniauth-gplus.png)](https://travis-ci.org/krainboltgreene/omniauth-gplus)
  - [![Dependency Status](https://gemnasium.com/krainboltgreene/omniauth-gplus.png)](https://gemnasium.com/krainboltgreene/omniauth-gplus)
  - [![Coverage Status](https://coveralls.io/repos/krainboltgreene/omniauth-gplus/badge.png?branch=master)](https://coveralls.io/r/krainboltgreene/omniauth-gplus)

`omniauth-gplus` is a Google+ strategy for OmniAuth.
It allows you to easily interact with the Google+ OAuth2 endpoint.


Examples
--------

To use `omniauth-gplus` in Rails you only need to put this in a initializer:

``` ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :gplus, ENV['GPLUS_KEY'], ENV['GPLUS_SECRET']
end
```

By default the gem uses the `email` scope, but you can get more information with:

``` ruby
provider :gplus, ENV['GPLUS_KEY'], ENV['GPLUS_SECRET'], scope: 'email, profile'
```

The information schema looks like this:

``` ruby
info do
  {
    'email' => 'kurtisrainboltgreene@gmail.com',
    'name' => 'Kurtis Rainbolt-Greene',
    'first_name' => 'Kurtis',
    'last_name' => 'Rainbolt-Greene',
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


Installing
----------

**Requirements**:

  1. Ruby 1.9 OR Rubinius 1.9 OR JRuby 1.9
  2. A GPlus API key/secret

You can either install manually:

``` bash
$ gem install omniauth-gplus
```

Or put it in your `Gemfile`:

``` ruby
source 'https://rubygems.org'

gem 'omniauth-gplus', '~> 1.0'
```


Issues & Documentation
----------------------

* [Documentation](https://github.com/krainboltgreene/omniauth-gplus/wiki)
* [Issues](https://github.com/krainboltgreene/omniauth-gplus/issues)

Absolutely feel free to contribute, please!


Changelog
---------

**v1.0.0**

* Initial release


Contributing
------------

* **Fork** the repository
* **Clone the repository** locally, or **edit via Github**
* Create a **new branch** using the [Git Flow Standard](http://yakiloo.com/getting-started-git-flow/) conventions
* Commit **often** and **when important**
* **DO NOT CHANGE** ANY OF THESE (without making a new branch for *that* change):
  * `*.gemspec`
  * `Rakefile`
  * `.rvmrc`
  * `.gitignore`
  * Any part of the git history
* **Write tests** specifically for the changes you've made, if no test exist
* **Push** your feature or hotfix branch to Github.
* Make a **Pull Request**


Credits
-------


License
-------

Copyright (c) 2013 Kurtis Rainbolt-Greene

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
