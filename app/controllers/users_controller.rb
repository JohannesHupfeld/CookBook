class UsersController < ApplicationController
  
  # Render login page(form)
  get '/login' do
    erb :'/users/login'
  end

  # Creates session. Recieves the login form, find the user, and log user in. 
  post '/login' do
    @user = User.find_by(email: params[:email ]) # Find user
    if @user.authenticate(params[:password]) # Checks if they have credentials - email/password combo
      session[:user_id] = @user.id # Log user in - create the user session # Assigning key value pair to the session hash
      puts session
      redirect "users/#{@user.id}" # Redirect to users show page 
    else
      # redirect to '/login'
    end
  end

  # Render signup form
  get '/signup' do # Submits to post '/users'
    erb :'/users/signup'  
  end

  post '/users' do
    # {"name"=>"john", "email"=>"email@email.com", "password"=>"cats"}
    if params[:name] != "" && params[:email] != "" && params[:password] != "" # Valid input
      @user = User.create(params)
      session[:user_id] = @user.id 
      redirect "/users/#{@user.id}"
    else
      # Not valid input
      # Include message?
      redirect '/signup'
    end
  end

  # User SHOW page
  get '/users/:id' do 
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

  get '/logout' do
    session.clear # Ends session
    redirect '/'
  end
end