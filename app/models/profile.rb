class Profile < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :user_id
  attr_accessible :user_name, :user_type, :about_me, :references, :user_id
end