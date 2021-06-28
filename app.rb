require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'
require './lib/space'

class MakersBnB < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  post '/signup' do
    User.sign_up(name: params[:name], email: params[:email], password: params[:password])
    redirect '/spaces'
  end 

  get '/spaces' do

  end

  run! if app_file == $0
end