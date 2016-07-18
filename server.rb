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

def load_user
  user_id = session[:user_id]
  if user_id == 9876
    @user = OpenStruct.new(
      user_id: '9876',
      email: 'john.doe@example.com',
      user_hash: user_hash(user_id),
      created_at: 1234567890,
      name: 'John Doe'
    )
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
  session[:user_id] = 9876
  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  redirect '/'
end
