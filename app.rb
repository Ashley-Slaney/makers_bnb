require 'sinatra/base'
# require 'sinatra/flash'
require 'sinatra/reloader'
require './lib/user'
require './lib/space'
require './database_connection_setup'

class MakersBnB < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  # Index page 

  get '/' do
    erb(:'index') 
  end 

  # User sign up and sign-in

  post '/sign_up' do
    # if params[:password_one] != params[:password_two]
    User.sign_up(name: params[:name], email: params[:email], password: params[:password_one])
    redirect '/spaces'
  end 

  get '/sign_in' do
    erb :'sign_in'
  end

  post '/sign_in' do
    redirect '/spaces'
  end

  # Spaces default view, add new space and filter spaces

  get '/spaces' do
    @space = Space.all
    erb :spaces
  end

  post '/date_range' do
    @space = Space.filter(date_avail: params[:date_avail]) 
    erb :spaces_filtered
  end
  
  get '/addnewspace' do
    erb :new_space
  end

  post '/addnewspace' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], date_avail: params[:date_avail])
    redirect '/spaces'
  end

  run! if app_file == $0

end