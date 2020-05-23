# Application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_ip_whitelist
  before_action :authenticate

  private

  def check_ip_whitelist
    return if Rails.env.development?
    return if Rails.application.secrets.permitted_ips.blank?
    return if Rails.application.secrets.permitted_ips.split( /[, ]/ ).include? request.ip

    render plain: 'Access Denied', status: :unauthorized
  end

  def authenticate
    return if session[:email]
    return if request.path =~ /google_oauth2/
    return if ENV['DISABLE_AUTH']

    redirect_to '/auth/google_oauth2'
  end
end
