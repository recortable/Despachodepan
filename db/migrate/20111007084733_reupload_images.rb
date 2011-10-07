class ReuploadImages < ActiveRecord::Migration
  def up
    Slide.all.each do |slide|
      pan = new_pan(slide)
      pan.card_id = slide.card_id
      pan.text = slide.text
      pan.position = slide.pos
      pan.date = slide.date
      pan.text = slide.text
      pan.extra = slide.extra
      pan.rev_date = slide.rev_date
      image = slide.image
      if image
        path = File.join(Dir.getwd, 'public', image.filename.url)
        if File.exist?(path)
          puts "Uploading image #{path}"
          pan.image = File.open(path)
          pan.content_type = image.content_type
          pan.size = image.size
          pan.width = image.width
          pan.height = image.height
          pan.image = image.stored
          pan.save!
          puts "Saved!"
        else
          puts "PATH NOT FOUND #{path} (#{image.id})"
        end
      end
    end
  end

  def down
  end

  def new_pan(slide)
    if slide.rol == 'slide'
      SlideImage.new
    elsif slide.rol == 'news'
      Post.new
    elsif slide.rol == 'selection'
      Selection.new
    end
  end

end
