require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "cookbook_secret"
  end

  get "/" do 
    erb :welcome
  end

  helpers do
    def logged_in?
      # True if the user is logged in, otherwise false
      !!current_user # Take a value and turns it into a boolean reflection of its truth of an objects truthiness. 
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
