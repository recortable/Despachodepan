class AddSlugToCards < ActiveRecord::Migration
  def change
  end

  def old_change
    add_column :cards, :slug, :string, limit: 300
    add_index :cards, :slug

    ActiveRecord::Base.record_timestamps = false
    Card.find_each(&:save)
    ActiveRecord::Base.record_timestamps = true
  end
end
