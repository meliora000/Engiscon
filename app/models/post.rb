class Post < ActiveRecord::Base
  belongs_to :category
  mount_uploader :avatar, AvatarUploader
end
