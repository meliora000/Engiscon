class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  default_scope { order(created_at: :desc) }
  scope :ordered_by_name, -> { reorder(url: :asc) }

  before_save do
    if(self.url.include?("youtube"))
      self.url = self.url.split("=").second.split("&").first
    end
  end
end
