Omniauth-Matique
================
[![Gem Version](https://badge.fury.io/rb/omniauth-matique.svg)](https://badge.fury.io/rb/omniauth-matique)

# OmniAuth Matique Strategy

Strategy to authenticate with matiq UG (haftungsbeschränkt)
via OAuth2 in OmniAuth.

## Installation

Add to your `Gemfile`:

```ruby
gem 'omniauth-matique'
```

Then `bundle install`.

## Usage

Here's an example for adding the middleware to a
Rails app (config/initializers/omniauth.rb):

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :matique, ENV["CLIENT_ID"], ENV["CLIENT_SECRET"]
end
OmniAuth.config.logger = Rails.logger
```

Here's an routing example for a Rails app (config/routes.rb):

```ruby
match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
get '/auth/failure', to: 'sessions#failure'

get '/auth/login', to: 'sessions#new', as: :login
get '/auth/logout', to: 'sessions#destroy', as: :logout
```

You must take care about (see also sample "app"):
- app/controllers/sessions_controller.rb
- config/initializers/omniauth.rb

You can now access the OmniAuth Matique URL: /auth/matique


## Credits

Inspiration from the web.
See also:

- http://intridea.github.io/omniauth/
- http://blog.joshsoftware.com/2010/12/16/multiple-applications-with-devise-omniauth-and-single-sign-on/
- http://codetheory.in/rails-devise-omniauth-sso/
- https://github.com/intridea/omniauth.git

Copyright (c) 2016..2019 Dittmar Krall, released under the MIT license.
