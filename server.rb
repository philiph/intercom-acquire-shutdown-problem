require 'sinatra'

get '/' do
  redirect '/signed_out'
end

before do
  @intercom_app_id = 'xyz'
end

get '/signed_out' do
  erb :signed_out
end

get '/signed_in' do
  erb :signed_in
end
