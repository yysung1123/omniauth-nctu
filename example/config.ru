      begin
        require 'sinatra'
        require 'omniauth'
        require 'omniauth-nctu'
      rescue LoadError
        require 'rubygems'
        require 'sinatra'
        require 'omniauth'
        require 'openid/store/filesystem'
        require 'omniauth-nctu'
      end

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
        # do whatever you want with the information!
        erb "您好，#{request.env['omniauth.auth'].to_hash["uid"]}。您的D2信箱是#{request.env['omniauth.auth'].to_hash["info"]["d2_email"]}。"
      end
