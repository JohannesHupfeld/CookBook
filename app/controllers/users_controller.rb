class UsersController < ApplicationController
  
  # Render login page(form)
  get '/login' do
    erb :login
  end


  get '/signup' do
  end

end
