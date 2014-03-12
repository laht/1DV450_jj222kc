# encoding = utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private 
  helper_method :current_user, :require_login

  def current_user
  	@current_user ||= User.find(session[:userid]) if session[:userid]
  end

  def default_format_json
    if ((request.headers["HTTP_ACCEPT"].nil? && params[:format].nil?) || (
      request.headers["HTTP_ACCEPT"] != "application/xml" && params[:format] != "xml"))
      request.format = "json"
    end
  end

  def require_login
  	if current_user.nil? then
  		redirect_to  root_path, :notice => "Du måste logga in"
  	end
  end

  def isLoggedin
    if current_user
      redirect_to loggedin_path
    end
  end

end
