class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  include SessionsHelper

  def require_logged_in
    if !current_user.nil?
      session[:require_logged_in] = true
    end

    puts session[:require_logged_in]

    if !session[:require_logged_in]
      session[:redirect_to] = request.env['REQUEST_PATH']
      render 'internal/index'
    end
  end

end
