require 'rails_helper'

RSpec.describe "User authentication", js: false do
  it 'succeeds' do
    visit '/'
    expect( page ).to have_http_status :ok
  end

end
