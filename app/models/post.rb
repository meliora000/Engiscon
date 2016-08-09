class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  default_scope { order(created_at: :desc) }
  scope :ordered_by_name, -> { reorder(url: :asc) }
end
