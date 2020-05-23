# Docs: http://www.rubydoc.info/gems/paperclip/Paperclip/Storage/S3
# Example: https://github.com/Gargron/mastodon/blob/master/config/initializers/paperclip.rb

return unless ENV['AWS_ACCESS_KEY_ID']

# :nocov:
Paperclip::Attachment.default_options[ :storage        ] = :s3
Paperclip::Attachment.default_options[ :url            ] = ':s3_alias_url'
Paperclip::Attachment.default_options[ :path           ] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[ :s3_protocol    ] = 'https'
Paperclip::Attachment.default_options[ :s3_permissions ] = 'public-read'
Paperclip::Attachment.default_options[ :s3_host_alias  ] = ENV.fetch( 'S3_HOST_ALIAS' )
Paperclip::Attachment.default_options[ :s3_region      ] = ENV.fetch( 'S3_REGION' ) { 'eu-west-1' }
Paperclip::Attachment.default_options[ :s3_headers     ] = { 'Cache-Control' => 'max-age=315576000', 'Expires' => 10.years.from_now.httpdate }
Paperclip::Attachment.default_options[ :s3_credentials ] = {
    access_key_id:     ENV.fetch( 'AWS_ACCESS_KEY_ID'     ),
    secret_access_key: ENV.fetch( 'AWS_SECRET_ACCESS_KEY' ),
    bucket:            ENV.fetch( 'S3_BUCKET'             )
}
# :nocov:
