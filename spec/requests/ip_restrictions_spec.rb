require 'rails_helper'

RSpec.describe "User attempts to view items", type: :request do
  it 'allows anyone if there are no permitted-IPs list' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( nil )

    get '/'
    expect( response.body ).to have_css 'a[href="/search"]'
  end

  it 'allows a matching ip with basic permitted-IPs list' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( '127.0.0.1' )

    get '/'

    expect( response.body ).to have_css 'a[href="/search"]'
  end

  it 'allows a matching ip with bracketed notes' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( '127.0.0.1 (localhost)' )

    get '/'

    expect( response.body ).to have_css 'a[href="/search"]'
  end

  it 'allows a matching ip with multi-line permitted-IPs list in place' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return(<<~PERMITTED_IPS)
      127.0.0.1  # localhost
      19.168.0.1 # local netblock
    PERMITTED_IPS

    get '/'

    expect( response.body ).to have_css 'a[href="/search"]'
  end

  it 'blocks non-matching permitted-IPs' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( '1.3.3.7' )

    get '/'

    expect( response.body ).to have_text 'Access Denied'
  end

  it 'Disallows a non matching ip in a custom header with basic permitted-IPs list' do
    allow( ApplicationController ).to receive( :client_ip_header_from_env ).and_return('CF-Connecting-Ip')
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( '' )
    get '/', headers: {'CF-Connecting-Ip' => '127.0.0.1' }

    expect( response.body ).to have_text 'Access Denied'
  end

  it 'Allows a matching ip in a custom header with basic permitted-IPs list' do
    allow( ApplicationController ).to receive( :client_ip_header_from_env ).and_return('CF-Connecting-Ip')
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( '127.0.0.1' )

    get '/', headers: {'CF-Connecting-Ip' => '127.0.0.1' }

    expect( response.body ).to have_css 'a[href="/search"]'
  end
end
