class Post < ActiveRecord::Base
  validates_presence_of :category, :user_id
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :participants
  mount_uploader :avatar, AvatarUploader
  default_scope { order(created_at: :desc) }
  scope :ordered_by_name, -> { reorder(url: :asc) }

  before_save do
    if(self.url.include?("youtube"))
      self.url = self.url.split("=").second.split("&").first
    end
  end
end
