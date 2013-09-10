class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  protect_from_forgery with: :exception
#  protect_from_forgery with: :null_session
  protect_from_forgery except: :index
  before_action :require_login
  
  private
    def require_login
       if session[:auth] == nil
          flash[:error] = "You must be logged in to access this section"
          redirect_to '/users/login' # halts request cycle
       end
    end
end
