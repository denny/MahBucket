class Item < ApplicationRecord
  # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_attached_file :file, styles: lambda { |attachment|
    if attachment.instance.image?
      {display: "800x800>", small: "400x400>", thumbnail: "100x100>" }
    else
      {}
    end
  }
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  do_not_validate_attachment_file_type :file
  # Tagging
  acts_as_taggable

  validates_uniqueness_of :file_fingerprint,
    message: 'error: This file has already been uploaded - please try searching for it by filename or by tag.'
  # TODO: link to previous upload (find by fingerprint)

  # Check to see if the file is an image before generating thumbnails etc
  before_post_process :image?
  def image?
    file_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}
  end
end

