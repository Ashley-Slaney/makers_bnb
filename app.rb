require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './lib/user'
require './lib/space'
require './database_connection_setup'

class MakersBnB < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  enable :sessions

  # Index page 

  get '/' do
    erb(:'index') 
  end 

  # User sign up and sign-in

  post '/sign_up' do
    if params[:password_one] != params[:password_two]
      flash[:notice] = 'Passwords do not match'
      redirect '/'
    elsif params[:password_one] == "" || params[:password_two] == ""
      flash[:notice] = 'Please enter a password'
      redirect '/'
    else
      user = User.sign_up(name: params[:name], email: params[:email], password: params[:password_one])
      session[:id] = user.id
      redirect '/spaces'
    end
  end

  get '/sign_in' do
    erb :'sign_in'
  end
  
   post '/sign_out' do
    session.clear
    flash[:cullmike] = 'You have signed out.'
    redirect '/'
  end
 

  post '/sign_in' do
    #
    #session[:email] = params[:email]
    #
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:id] = user.id
      session[:password] = user.password
      redirect('/spaces')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sign_in')
    end
  end

  # Spaces default view, add new space and filter spaces

  post '/date_range' do
    @space = Space.filter(date_avail: params[:date_avail]) 
    erb :spaces_filtered
  end
  
  get '/addnewspace' do
    erb :new_space
  end

  post '/addnewspace' do
    @user = User.find(id: session[:id])
    Space.create(name: params[:name], description: params[:description], price: params[:price], date_avail: params[:date_avail], host_email: @user.email)
    redirect '/spaces'
  end
  
  

  get '/spaces' do
    #Space.list_spaces_by_email(host_email: "john@gmail.com")
    #@email_space.host_email
    @user = User.find(id: session[:id])
    @space = Space.all
    @message = session[:message]
    
    flash[:accepted!] = 'Request accepted!'
    erb :spaces
  end
  

  post '/spaces' do
    session[:message] = params[:message]
    @user = User.find(id: session[:id])
    @user.email
    redirect '/spaces'
  end

  post '/user_spaces' do 
    
    redirect '/user_spaces'
  end

  get '/user_spaces' do 
     @user = User.find(id: session[:id])
     @user_spaces = Space.list_spaces_by_email(host_email: @user.email)
     erb :user_spaces
  end
  
  
  run! if app_file == $0

end