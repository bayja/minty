class AddUserIdToDesignImage < ActiveRecord::Migration
  def change
    add_column :design_images, :user_id, :integer
  end
end
