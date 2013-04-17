class DesignImage < ActiveRecord::Migration
  def change
    create_table :design_images do |t|
      t.string :name
      t.string :content_type
      t.binary :data, :limit => 1.megabyte
    end
  end
end