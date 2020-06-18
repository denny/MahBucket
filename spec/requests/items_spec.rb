require 'rails_helper'

RSpec.describe 'Create/Update/Delete items', type: :request do
  before :each do
    allow_any_instance_of( ItemsController ).to receive( :authenticate ) {}
  end

  describe 'GET /items/new' do
    it 'shows the form for adding a new item' do
      get '/items/new'

      expect( response.body ).to have_css 'h1', text: 'Add new file'
      expect( response.body ).to have_field 'item_file'
    end
  end

  describe 'GET /items/1/edit' do
    it 'shows the form for adding a new item' do
      item = Item.create!( file: File.new( Rails.root + 'spec/fixtures/mah-bucket.jpg' ) )

      get "/items/#{item.id}/edit"

      expect( response.body ).to have_css 'h1', text: 'Editing file: mah-bucket.jpg'
      expect( response.body ).to have_field 'item_file'
    end
  end

  describe 'POST /items' do
    it 'successfully submits the form for adding a new item' do
      post '/items', params: {
        'item[item_file]': fixture_file_upload( 'spec/fixtures/mah-bucket.jpg' )
      }

      expect( response ).to have_http_status :found
      expect( response ).to redirect_to "/items/#{Item.last.id}"
      follow_redirect!
      expect( response ).to have_http_status :ok
      expect( response.body ).to have_text 'Item was created.'
    end
  end

  describe 'PUT /items/1' do
    it 'successfully submits the form for updating an item' do
      item = Item.create!( file: File.new( Rails.root + 'spec/fixtures/test.txt' ) )

      put "/items/#{item.id}", params: {
        'item[item_file]': fixture_file_upload( 'spec/fixtures/mah-bucket.jpg' )
      }

      expect( response ).to have_http_status :found
      expect( response ).to redirect_to "/items/#{item.id}"
      follow_redirect!
      expect( response ).to have_http_status :ok
      expect( response.body ).to have_text 'Item was updated.'
    end
  end

  describe 'DELETE /items/1' do
    it 'deletes an item' do
      item = Item.create!( file: File.new( Rails.root + 'spec/fixtures/test.txt' ) )

      delete "/items/#{item.id}"

      expect( response ).to have_http_status :found
      expect( response ).to redirect_to '/items'
      follow_redirect!
      expect( response ).to have_http_status :ok
      expect( response.body ).to have_text 'Item was deleted.'
    end
  end
end
