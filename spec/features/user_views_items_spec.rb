require 'rails_helper'

RSpec.feature "User views items", type: :feature, js: true do
    scenario 'successfully' do
        visit '/'
        expect( page ).to have_css 'a[href="/search"]'
    end
    
    scenario 'sees "no items yet" notice' do
        visit '/'
        expect( page ).to have_text 'You have not added any items yet'
    end
    
    scenario 'sees newly-added item' do
        Item.create!(
            :file => File.new( Rails.root + 'spec/fixtures/mah-bucket.jpg' )
        )
        visit '/'
        expect( page ).to have_link 'mah-bucket.jpg'
    end
end
