class Follow < ActiveRecord::Base

	self.table_name = "users_have_followings"

	belongs_to :follower, :foreign_key => "user_id", class_name: 'User'
	belongs_to :following, :foreign_key => "following_id", class_name: 'User'
end
