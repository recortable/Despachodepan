class AddStoredToCardFileAndImage < ActiveRecord::Migration
  def change
    add_column :card_files, :stored, :string, :limit => 300
    add_column :images, :stored, :string, :limit => 300
  end
end


