class UsersController < ApplicationController
  # Render signup form
  get '/signup' do # Submits to post '/users'
    erb :'/users/signup'  
  end
  
  post '/users' do
    # {"name"=>"john", "email"=>"email@email.com", "password"=>"cats"}
    if params[:name] != "" && params[:email] != "" && params[:password] != "" # Valid input
      @user = User.create(params)
      session[:user_id] = @user.id 
      flash[:message] = "Welcome #{@user.name}, you have successfully created an account!"
      redirect "/users/#{@user.id}"
    else
      flash[:errors] = "All fields are required to created account"
      redirect '/signup'
    end
  end
  
  # Render login page(form)
  get '/login' do
    erb :'/users/login'
  end

  # Creates session. Recieves the login form, find the user, and log user in. 
  post '/login' do
    @user = User.find_by(email: params[:email]) # Find user
    if @user && @user.authenticate(params[:password]) # Checks if they have credentials - email/password combo
      session[:user_id] = @user.id # Log user in - create the user session # Assigning key value pair to the session hash
      flash[:message] = "Welcome, #{@user.name}!"
      redirect "users/#{@user.id}" # Redirect to users show page 
    else
      flash[:errors] = "Invalid Email or Password, please try again."
      redirect to '/login'
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