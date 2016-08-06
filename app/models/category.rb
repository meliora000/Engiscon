class Category < ActiveRecord::Base
  has_many :posts
  attr_accessor :sub
end
