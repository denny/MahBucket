class Item < ApplicationRecord
  # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_attached_file :file, styles: { display: "800x800>", small: "400x400>", thumbnail: "100x100>" }
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  do_not_validate_attachment_file_type :file
  # Tagging
  acts_as_taggable

  # Check to see if the file is an image before generating thumbnails etc
  before_post_process :image?
  def image?
    /^image\/\w+/ === file_content_type
  end
end
