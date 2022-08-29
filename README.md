# Omniauth Lokalise

![Gem](https://img.shields.io/gem/v/omniauth-lokalise)
![CI](https://github.com/bodrovis/omniauth-lokalise/actions/workflows/ci.yml/badge.svg)

This is an official OmniAuth strategy for [https://lokalise.com](Lokalise).

## Prerequisites

As the first step, you have to register a new OAuth 2 app at Lokalise by contacting the support team and providing the following info:

* Title of your application
* Logo of your application (150x150px, PNG or JPG)
* Description of your application (optional)
* Link to app website/documentation (optional)
* Required scopes. Find the list required scopes for the corresponding API endpoints in the [Lokalise API docs](https://app.lokalise.com/api2docs/curl/). Please note that your can further adjust these scopes as needed when setting up Omniauth.

After registering, you'll obtain a client ID and client secret. **Do not publicly expose your client secret!**

[*Find detailed information in the Lokalise docs.*](https://docs.lokalise.com/en/articles/5574713-oauth-2)

## Installation

Add a new gem to your `Gemfile`:

```ruby
gem 'omniauth-lokalise'
```

You will also probably require the following gem:

```ruby
gem "omniauth-rails_csrf_protection"
```

Run:

```
bundle install
```

## Configuration

Create a new `config/initializers/omniauth.rb` file with the following contents:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :lokalise, 'OAUTH2_CLIENT_ID', 'OAUTH2_CLIENT_SECRET',
    scope: 'required_scopes'
end
```

Paste your client ID, client secret and a list of scopes separated with spaces, for example: `'read_projects write_files'`.

## Usage

Add a login button somewhere in your views (disable Turbo if you use it in your app):

```html
<%= form_tag('/auth/lokalise', method: 'post', data: {turbo: false}) do %>
  <button type='submit'>Login with Lokalise</button>
<% end %>
```

Create a callback route:

```ruby
get '/auth/:provider/callback', to: 'sessions#create'
```

Use `request.env['omniauth.auth']` to fetch OAuth 2 access token and refresh token:

```ruby
token = request.env['omniauth.auth']['credentials']['token']
refresh_token = request.env['omniauth.auth']['credentials']['refresh_token']
```

Please note that currently Lokalise does not provide any information about the logged in user except for credentials. In other words, you can't get access to the user name, uid, email, etc.

## Using refresh token

Access tokens usually expire in 60 minutes but you can request a new one using refresh token. To achieve that, utilize [ruby-lokalise-api](https://github.com/lokalise/ruby-lokalise-api) client:

```ruby
require 'ruby_lokalise_api'

auth_client = RubyLokaliseApi.auth_client 'OAUTH2_CLIENT_ID', 'OAUTH2_CLIENT_SECRET'
response = auth_client.refresh 'YOUR_REFRESH_TOKEN'
token = response['access_token']
```

## License

This gem is licensed under the [MIT license](./LICENSE).

(c) 2022 Ilya Krukowski
