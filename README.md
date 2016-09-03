# Omniauth::Nctu

使用OmniAuth實作NCTU-Oauth登入認證的Ruby套件

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-nctu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-nctu

Example

```ruby
require 'sinatra'
require 'omniauth-nctu'

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :nctu, ENV['NCTU_OAUTH_KEY'], ENV['NCTU_OAUTH_SECRET']
end

get '/' do
  <<-HTML
    <a href='/auth/nctu'>Sign in with NCTU</a>
  HTML
end

get '/auth/nctu/callback' do
  request.env['omniauth.auth'].to_hash.inspect rescue "No Data"
  erb "您好，#{request.env['omniauth.auth'].to_hash["uid"]}。您的D2信箱是#{request.env['omniauth.auth'].to_hash["info"]["d2_email"]}。"
end
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deror1869107/omniauth-nctu.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

