class OrderPanFiles < ActiveRecord::Migration
  def up
    ActiveRecord::Base.record_timestamps = false
    Card.all.each do |card|
      card.pan_files.each_with_index do |file, index|
        file.update_attribute(:position, index + 1)
      end
    end
    ActiveRecord::Base.record_timestamps = true
  end

  def down
  end
end
