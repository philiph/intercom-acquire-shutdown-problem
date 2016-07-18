require 'sinatra'
require 'ostruct'
require 'openssl'

enable :sessions

set :intercom_app_id, 'xyz'
set :intercom_secret, 'xyz'

before do
  @intercom_app_id = settings.intercom_app_id
  load_user
end

def users
  [
    OpenStruct.new(
      user_id: '9876',
      email: 'john.doe@example.com',
      created_at: 1234567890,
      name: 'John Doe'
    )
  ]
end

def load_user
  user_id = session[:user_id]
  if user_id
    @user = users.select { |u| u.user_id == user_id.to_s }.first
    @user.user_hash = user_hash(@user.user_id)
    @user
  end
end

def user_hash(user_id)
  OpenSSL::HMAC.hexdigest(
    OpenSSL::Digest.new('sha256'),
    settings.intercom_secret,
    user_id.to_s
  )
end

get '/' do
  erb :home
end

get '/about' do
  erb :about
end

get '/sign_in' do
  user = users.first
  session[:user_id] = user.user_id
  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  redirect '/'
end
