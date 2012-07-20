class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_name, :user_type, :about_me, :references
end