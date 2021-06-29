require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './lib/user'
require './lib/space'
require './database_connection_setup'

class MakersBnB < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb(:'index') 
  end 

 
  post '/sign_up' do
    User.sign_up(name: params[:name], email: params[:email], password: params[:password])
    redirect '/spaces'
  end 

  get '/sign_in' do
    erb :'sign_in'
  end

  post '/sign_in' do
    redirect '/spaces'
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
  
  run! if app_file == $0

end