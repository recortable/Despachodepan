class CreatePans < ActiveRecord::Migration
  def change
    # No hace falta borrar ninguna imágen de momento
    #Image.all.each do |image|
    #  if image.stored.blank? or image.slides.count == 0
    #    puts "Borrando imagen #{image.id}"
    #    image.destroy
    #  end
    #end

    create_table :pans do |t|
      t.string :type, limit: 32
      t.belongs_to :card
      t.string :text, :limit => 300
      t.integer :position
      t.string :date, :limit => 100
      t.text :body
      t.string :extra, :limit => 32
      t.string :rev_date, :limit => 16
      t.string :content_type, :limit => 64
      t.integer :size
      t.integer :width
      t.integer :height
      t.string :file, :limit => 300
      t.integer :original_id
      t.timestamps
    end


  end

end
