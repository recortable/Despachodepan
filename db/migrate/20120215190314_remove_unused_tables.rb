class RemoveUnusedTables < ActiveRecord::Migration
  def up
    drop_table :users
    drop_table :card_files
    drop_table :images
    drop_table :slides
  end

  def down
  end
end
