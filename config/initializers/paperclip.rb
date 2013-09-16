if Rails.env.production?
  Paperclip::Attachment.default_options[:url] = 'seriematosk.s3.amazonaws.com'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
end
