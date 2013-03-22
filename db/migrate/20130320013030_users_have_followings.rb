class UsersHaveFollowings < ActiveRecord::Migration
	def change
		create_table :users_have_followings, :id => false do |t|
      		t.integer :user_id
      		t.integer :following_id
    	end
	end
end
