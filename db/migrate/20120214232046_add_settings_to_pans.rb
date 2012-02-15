class AddSettingsToPans < ActiveRecord::Migration
  def change
    ActiveRecord::Base.record_timestamps = false

    add_column :pans, :settings, :string, limit: 200

    SlideImage.all.each do |slide|
      if slide.extra == 'main'
        slide.card.update_attribute(:main_slide_id, slide.id)
      end

      slide.timeline_position = slide.date
      slide.save
    end

    Selection.all.each do |selection|
      selection.row_position = selection.extra == 'top' ? 'Arriba' : 'Abajo'
      selection.save
    end

    remove_column :pans, :extra
  end
end
