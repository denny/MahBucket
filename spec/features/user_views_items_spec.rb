require 'rails_helper'

RSpec.describe "User views items", type: :feature, js: true do
  it 'successfully' do
    visit '/'

    expect( page ).to have_css 'a[href="/search"]'
  end

  it 'sees "no items yet" notice' do
    visit '/'

    expect( page ).to have_text 'You have not added any items yet'
  end

  it 'sees newly-added items' do
    Item.create!( file: File.new( Rails.root + 'spec/fixtures/mah-bucket.jpg' ) )
    Item.create!( file: File.new( Rails.root + 'spec/fixtures/test.txt' ) )

    visit '/'

    expect( page ).to have_link 'mah-bucket.jpg'
    expect( page ).to have_link 'test.txt'
  end

  it 'but is foiled by IP restriction' do
    allow( Rails.application.secrets ).to receive( :permitted_ips ).and_return( 'FAIL' )

    visit '/'

    expect( page ).to have_text 'Access Denied'
  end
end
