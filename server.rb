require 'sinatra'

get '/' do
  redirect '/signed_out'
end

before do
  @intercom_app_id = 'xyz'
end

get '/signed_out' do
  @user_signed_in = false
  erb :signed_out
end

get '/signed_in' do
  @user_signed_in = true
  erb :signed_in
end
