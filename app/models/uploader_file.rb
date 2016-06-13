class UploaderFile < ApplicationRecord
  belongs_to :message

  mount_uploader :picture, PictureUploader
  mount_uploader :file, FileUploader
  mount_uploader :video, VideoUploader
end
