# Application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_permitted_ips
  before_action :authenticate

  def self.permitted_ips
    ENV['PERMITTED_IPS']
  end

  private

  def check_permitted_ips
    return if Rails.env.development?
    return if self.class.permitted_ips.blank?

    ip_addresses = list_of_permitted_ips( self.class.permitted_ips )
    return if ip_addresses.include? request.ip

    render plain: 'Access Denied', status: :unauthorized
  end

  def list_of_permitted_ips( permitted_ips )
    ip_addresses = []
    permitted_ips_lines = permitted_ips.split( /\n/ )

    if permitted_ips_lines.size > 1 || permitted_ips.include?('#')
      permitted_ips_lines.each do |line|
        matches = line.match( /^(?<ip_address>[a-f\d.:]+)[#\s]?.*$/ )
        ip_addresses << matches['ip_address'] if matches['ip_address'].present?
      end
      return ip_addresses
    end

    permitted_ips.split( /[, ]/ )
  end

  def authenticate
    return if session[:email]
    return if request.path =~ /google_oauth2/

    redirect_to '/auth/google_oauth2'
  end
end
