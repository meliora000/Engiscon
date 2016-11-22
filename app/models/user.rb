class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :participants


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.image    = auth.info.image
      user.save
    end
  end


  before_update do
    if (self.ename)
    self.ename = self.ename.split.map(&:capitalize).join(' ')
      end
  end
end
