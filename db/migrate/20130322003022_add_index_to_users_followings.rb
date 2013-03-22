class AddIndexToUsersFollowings < ActiveRecord::Migration
  def change
  	add_index :users_have_followings, [ :user_id, :following_id ], :unique => true, :name => 'by_user_and_following'
  end
end
