class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action do
    unless session[:email] or request.path =~ /google_oauth2/
      redirect_to '/auth/google_oauth2'
    end
  end
end
