require 'rails_helper'

RSpec.describe "User authentication", type: :feature, js: false do
  it 'succeeds' do
    visit '/'
    expect( page ).to have_http_status :ok
  end

  it 'fails for user not in authorised domain' do
    skip 'Need to figure out how to test failure with repost gem in the loop'

    original_user = OmniAuth.config.mock_auth[:google_oauth2]
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      {
        provider: 'google_oauth2',
        uid: '12345',
        info: {
          name:  'Charlotte Blackhat',
          email: 'charlotte@blackhat.con'
        }
      }
    )
    visit '/'
    expect( page ).to have_http_status :unauthorized
    OmniAuth.config.mock_auth[:google_oauth2] = original_user
  end
end
