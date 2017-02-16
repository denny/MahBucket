class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_ip_whitelist
  before_action :authenticate

  private

  def check_ip_whitelist
    if Rails.env.production?
      if Rails.application.secrets.permitted_ips
        unless Rails.application.secrets.permitted_ips.split(',').include? request.ip
          render text: 'Access Denied', status: :unauthorized
        end
      end
    end
  end

  def authenticate
    unless session[:email] or request.path =~ /google_oauth2/
      redirect_to '/auth/google_oauth2'
    end
  end

end
