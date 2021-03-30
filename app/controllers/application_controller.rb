require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "3b4101fca2e834791318d6f386bfe920c06fed6a2f7a7ab59ca31b41171a2e15522b0830fcbd00790f7d446a679dec7480e2f22d2bf49082e848c7b920132703"
    register Sinatra::Flash
  end

  get "/" do 
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  helpers do
    def logged_in?
      # True if the user is logged in, otherwise false
      !!current_user # Take a value and turns it into a boolean reflection of its truth of an objects truthiness. 
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) # Memoization
    end

    def authorized_to_edit?(recipe) # Recieves a recipe object 
      recipe.user == current_user
    end

    # Build helper method for redirecting if not logged in
    def redirecet_if_not_logged_in
      if !logged_in?
        flash[:errors] = "Must be logged in to view page"
        redirect '/'
      end
    end
  end
end