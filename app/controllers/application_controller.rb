# Application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_permitted_ips
  before_action :authenticate

  def self.permitted_ips_from_env
    ENV['PERMITTED_IPS']
  end

  def self.client_ip_header_from_env
    ENV['CLIENT_IP_HEADER']
  end

  private

  def check_permitted_ips
    return if Rails.env.development?
    return if self.class.permitted_ips_from_env.blank?

    ip_to_verify = self.class.client_ip_header_from_env ? request.headers[self.class.client_ip_header_from_env] : request.ip

    ip_addresses = list_of_permitted_ips( self.class.permitted_ips_from_env )

    Rails.logger.debug { "check_permitted_ips: checking ip: #{ip_to_verify} against #{ip_addresses}" }
    return if ip_addresses.include? ip_to_verify

    render plain: 'Access Denied', status: :unauthorized
  end

  def list_of_permitted_ips( ip_list_from_env )
    # Remove anything inside brackets - e.g. '127.0.0.1 (localhost)' -> '127.0.0.1 '
    permitted_ips = ip_list_from_env.gsub( /{\([^)]+\)/, '' )

    # Handle the simple case (not multiline, no #comments embedded)
    return permitted_ips.split( /[, ]+/ ) unless permitted_ips.match?( /[\n#]/ )

    # Handle multi-line and/or comments
    handle_ip_list_with_comments( permitted_ips )
  end

  def handle_ip_list_with_comments( permitted_ips )
    permitted_ips_lines = permitted_ips.split( "\n" )

    ip_addresses = []
    permitted_ips_lines.each do |line|
      matches = line.match( /^(?<ip_address>[a-f\d.:]+)[#\s]?.*$/ )
      ip_addresses << matches['ip_address'] if matches['ip_address'].present?
    end

    ip_addresses
  end

  def authenticate
    if Rails.env.test? && ENV['SKIP_AUTH']
      session[:email] = 'admin@example.com'
      return
    end
    return if session[:email]
    return if /google_oauth2/.match?(request.path)

    redirect_post('/auth/google_oauth2', options: {authenticity_token: :auto})
  end
end
