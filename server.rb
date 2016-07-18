require 'sinatra'

get '/' do
  redirect '/signed_out'
end

get '/signed_out' do
  "You are signed out"
end

get '/signed_in' do
  "You are signed in"
end
