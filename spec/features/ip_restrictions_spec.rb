require 'rails_helper'

RSpec.feature "User attempts to view items", type: :feature, js: true do
  scenario 'with no permitted-IPs list in place' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( nil )

    visit '/'

    expect( page ).to have_css 'a[href="/search"]'
  end

  scenario 'with a matching basic permitted-IPs list in place' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( '127.0.0.1' )

    visit '/'

    expect( page ).to have_css 'a[href="/search"]'
  end

  scenario 'with a matching permitted-IPs list in place with bracketed notes' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( '127.0.0.1 (localhost)' )

    visit '/'

    expect( page ).to have_css 'a[href="/search"]'
  end

  scenario 'with a matching multi-line permitted-IPs list in place' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return(<<~PERMITTED_IPS)
      127.0.0.1  # localhost
      19.168.0.1 # local netblock
    PERMITTED_IPS

    visit '/'

    expect( page ).to have_css 'a[href="/search"]'
  end

  scenario 'with non-matching permitted-IPs list in place' do
    allow( ApplicationController ).to receive( :permitted_ips_from_env ).and_return( '1.3.3.7' )

    visit '/'

    expect( page ).to have_text 'Access Denied'
  end
end
