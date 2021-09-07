require 'rails_helper'

RSpec.describe "User attempts to view items", type: :feature, js: true do
  it 'allows anyone if there are no permitted-IPs list' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( nil )

    visit '/'

    expect( page ).to have_css 'a[href="/search"]'
  end

  it 'allows a matching ip with basic permitted-IPs list' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( '127.0.0.1' )

    visit '/'

    expect( page ).to have_css 'a[href="/search"]'
  end

  it 'allows a matching ip with bracketed notes' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( '127.0.0.1 (localhost)' )

    visit '/'

    expect( page ).to have_css 'a[href="/search"]'
  end

  it 'allows a matching ip with multi-line permitted-IPs list in place' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return(<<~PERMITTED_IPS)
      127.0.0.1  # localhost
      19.168.0.1 # local netblock
    PERMITTED_IPS

    visit '/'

    expect( page ).to have_css 'a[href="/search"]'
  end

  it 'blocks non-matching permitted-IPs' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( '1.3.3.7' )

    visit '/'

    expect( page ).to have_text 'Access Denied'
  end

  it 'Disallows a non matching ip in a different header with basic permitted-IPs list' do
    allow( ApplicationController ).to receive( :client_ip_header_from_env ).and_return('CF-Connecting-Ip')
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( '' )

    visit '/'

    expect( page ).to have_text 'Access Denied'
  end
end
