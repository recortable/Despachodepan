class ReuploadImages < ActiveRecord::Migration
  def up
    say_with_time("Uploading main images") do
      Card.limit(5).all.each { |card| create_main_image_from_card(card) }
    end
    say_with_time("Uploading slides") do
      Slide.limit(5).all.each { |slide| create_pan_from_slide(slide) }
    end
    say_with_time("Uploading card files") do
      CardFile.limit(5).all.each { |file| create_pan_from_file(file) }
    end
  end

  def down
    Pan.destroy_all
  end

  def create_pan_from_file(file)
    say "Creating PanFile from card_file #{file.id}"
    pan = PanFile.new
    pan.original_id = file.id
    pan.card_id = file.card_id
    pan.content_type = file.content_type
    pan.size = file.size
    path = File.join(Dir.getwd, 'public', file.filename.url)
    pan.file = File.open(path)
    pan.save!
  end

  # @param card [Card]
  def create_main_image_from_card(card)
    if card.main_image.present?
      image = card.main_image
      say "Creating MainImage from image #{image.id}"
      pan = MainImage.new
      pan.original_id = image.id
      pan.card_id = card.id
      add_image(pan, image)
      pan.save!
    end
  end

  def create_pan_from_slide(slide)
    pan = new_pan(slide)
    say "Creating #{pan.class.name} from slide #{slide.id}"
    pan.original_id = slide.id
    pan.card_id = slide.card_id
    pan.text = slide.text
    pan.position = slide.pos
    pan.date = slide.date
    pan.text = slide.text
    pan.extra = slide.extra
    pan.rev_date = slide.rev_date
    pan.body = slide.body
    add_image(pan, slide.image)
    pan.save!
  end

  def add_image(pan, image)
    if image
      path = File.join(Dir.getwd, 'public', image.filename.url)
      if File.exist?(path)
        puts "Uploading image #{path}"
        pan.file = File.open(path)
        pan.content_type = image.content_type
        pan.size = image.size
        pan.width = image.width
        pan.height = image.height
        puts "Saved!"
      else
        puts "PATH NOT FOUND #{path} (#{image.id})"
      end
    end
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
