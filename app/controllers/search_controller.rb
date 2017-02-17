class SearchController < ApplicationController
  def search
    @tags = ActsAsTaggableOn::Tag.where( 'name ilike ?', "%#{params[:q]}%" ).order( :name ) if params[:q].present?
  end
end
