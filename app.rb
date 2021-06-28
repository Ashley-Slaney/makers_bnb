require 'sinatra/base'
require './lib/user'
require './lib/space'

class MakersBnB < Sinatra::Base 

  enable :sessions

   get 'signup/new' do
     erb(:'signup/new') 
   end 

   post '/signup' do 

   end 

   get '/addnewspace' do
    erb :new_space
  end

   post '/new_space' do
    sessions[:name] = params[:name]
    sessions[:description] = params[:description]
    sessions[:price] = params[:price]
    redirect '/spaces'
   end

   get '/spaces' do
     erb :spaces
   end


end