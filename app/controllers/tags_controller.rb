class TagsController < ApplicationController

  # GET /tags
  # GET /tags.json
  def index
    @tags = ActsAsTaggableOn::Tag.all.order( :name )
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

end
