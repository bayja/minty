class AddSessionIdToStat < ActiveRecord::Migration
  def change
    add_column :stats, :session_id, :string
  end
end
