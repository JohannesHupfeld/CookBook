class UsersController < ApplicationController
  
  # Render login page(form)
  get '/login' do
    erb :login
  end

  # Creates session. Recieves the login form, find the user, and log user in. 
  post '/login' do
    @user = User.find_by(email: params[:email ]) # Find user
    if @user.authenticate(params[:password]) # Checks if they have credentials - email/password combo
      session[:user_id] = @user.id # Log user in - create the user session # Assigning key value pair to the session hash
      puts session
      redirect "users/#{@user.id}" # Redirect to users show page 
    else

    end
  end

  get '/signup' do
  end

  # User SHOW page
  get '/users/:id' do 
    "this will be the user show route"
  end
end
