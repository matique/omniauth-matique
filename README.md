# Omniauth-Matique

[![Gem Version](https://img.shields.io/gem/v/omniauth-matique?color=168AFE&logo=rubygems&logoColor=FE1616)](https://rubygems.org/gems/omniauth-matique)
[![Downloads](https://img.shields.io/gem/dt/omniauth-matique?color=168AFE&logo=rubygems&logoColor=FE1616)](https://rubygems.org/gems/omniauth-matique)
[![GitHub Build](https://img.shields.io/github/actions/workflow/status/matique/omniauth-matique/rake.yml?logo=github)](https://github.com/matique/omniauth-matique/actions/workflows/rake.yml)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/standardrb/standard)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](http://choosealicense.com/licenses/mit/)

[![Gem Version](https://badge.fury.io/rb/omniauth-matique.svg)](https://badge.fury.io/rb/omniauth-matique)
[![GEM Downloads](https://img.shields.io/gem/dt/omniauth-matique?color=168AFE&logo=ruby&logoColor=FE1616)](https://rubygems.org/gems/omniauth-matique)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](http://choosealicense.com/licenses/mit/)

# OmniAuth Matique Strategy

Strategy to authenticate with matiq UG (haftungsbeschränkt)
via OAuth2 in OmniAuth.

## Installation

As usual:
```ruby
# Gemfile
gem "omniauth-matique"
```
and run "bundle install".

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

## Miscellaneous

Copyright (c) 2016-2025 Dittmar Krall (www.matiq.com),
released under the [MIT license](https://opensource.org/licenses/MIT).
