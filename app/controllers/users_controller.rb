class UsersController < ApplicationController
  
  # Render login page(form)
  get '/login' do
    erb :login
  end

  # Creates session. Recieves the login form, find the user, and log user in. 
  post '/login' do
    
  end

  get '/signup' do
  end

end
