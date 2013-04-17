class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string :ip
      t.string :os
      t.string :browser
      t.string :from

      t.timestamps
    end
  end
end
