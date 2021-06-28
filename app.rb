require 'sinatra/base'
require './lib/user'
require './lib/space'

class MakersBnB < Sinatra::Base 
   get 'signup/new' do
     erb(:'signup/new') 
   end 

   post '/signup' do 

   end 
end