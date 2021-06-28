require 'sinatra/base'
require './lib/user'
require './lib/space'
require 'sinatra/reloader'
require 'sinatra/flash'

class MakersBnB < Sinatra::Base
  
  
   get '/' do
    erb :'index'
   end 

   post '/sign_up' do
    redirect '/spaces'
   end 

   get '/sign_in' do
    erb :'sign_in'
  end

  post '/sign_in' do
    redirect '/spaces'
  end

  get '/spaces' do
    erb :'spaces'
  end
end