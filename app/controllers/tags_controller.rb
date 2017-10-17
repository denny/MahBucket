# Tag controller
class TagsController < ApplicationController
  # GET /tags
  # GET /tags.json
  def index
    @tags = ActsAsTaggableOn::Tag.all.order( :name )
  end

  def tag_cloud
    @tags = Item.tag_counts_on( :customs )
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = ActsAsTaggableOn::Tag.find( params[:id] )
  end
end
