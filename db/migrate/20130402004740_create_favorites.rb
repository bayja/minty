class CreateFavorites < ActiveRecord::Migration
  def change
    create_table(:favorites, { :id => false }) do |t|
      t.integer :user_id 
      t.integer :tweet_id

      t.timestamps
    end
  end
end
