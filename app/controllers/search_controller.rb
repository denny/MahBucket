# Search controller
class SearchController < ApplicationController
  def search
    if params[:q].present?
      @tag_results = ActsAsTaggableOn::Tag.where( 'name ilike ?', "%#{params[:q]}%" ).order( :name )
      @filename_results = Item.where( 'file_file_name ilike ?', "%#{params[:q]}%" ).order( :file_file_name )
    end
  end
end
