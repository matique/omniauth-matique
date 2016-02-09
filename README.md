RowsController
==============
[![Gem Version](https://badge.fury.io/rb/omniauth-matique.svg)](https://badge.fury.io/rb/omniauth-matique)
[![Build Status](https://travis-ci.org/matique/omniauth-matique.png?branch=master)](https://travis-ci.org/matique/omniauth-matique)

# OmniAuth Matique Strategy

Strategy to authenticate with matique UG via OAuth2 in OmniAuth.

## Installation

Add to your `Gemfile`:

```ruby
gem "omniauth-matique"
```

Then `bundle install`.

## Usage

Here's an example for adding the middleware to a
Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :matique, ENV["CLIENT_ID"], ENV["CLIENT_SECRET"]
end
```

You can now access the OmniAuth Matique URL: `/auth/matique`

## Credits

Inspiration from the web.
Look for:

- https://github.com/intridea/omniauth.git
- http://intridea.github.io/omniauth/
- http://blog.joshsoftware.com/2010/12/16/multiple-applications-with-devise-omniauth-and-single-sign-on/

Copyright (c) 2016 [Dittmar Krall], released under the MIT license.
