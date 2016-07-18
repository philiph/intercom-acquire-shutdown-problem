require 'sinatra'

get '/' do
  redirect '/signed_out'
end

get '/signed_out' do
  erb :signed_out
end

get '/signed_in' do
  erb :signed_in
end
