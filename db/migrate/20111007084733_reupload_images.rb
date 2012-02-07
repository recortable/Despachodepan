class ReuploadImages < ActiveRecord::Migration
  def up
    say_with_time("Uploading main images") do
      Card.order('id ASC').each { |card| create_main_image_from_card(card) }
    end
    say_with_time("Uploading slides") do
      Slide.order('id ASC').each { |slide| create_pan_from_slide(slide) }
    end
    say_with_time("Uploading card files") do
      CardFile.order('id ASC').each { |file| create_pan_from_file(file) }
    end
  end

  def down
    # Repeat the migration
    # Pan.destroy_all
  end

  def create_pan_from_file(file)
    previous = PanFile.find_by_original_id(file.id)
    unless previous.present?
      say_with_time "Creating PanFile from card_file #{file.id}" do
        pan = PanFile.new
        pan.original_id = file.id
        pan.card_id = file.card_id
        pan.text = file.title
        pan.content_type = file.content_type
        pan.size = file.size
        path = File.join(Dir.getwd, 'public', file.filename.url)
        pan.file = File.open(path)
        pan.save!
      end
    else
      say "Adding title to PanFile from card_file #{file.id} (present)"
      previous.text = file.title
      previous.save
    end
  end

  # @param card [Card]
  def create_main_image_from_card(card)
    image = card.old_main_image
    if image.present?
      unless MainImage.find_by_original_id(image.id).present?
        say_with_time "Creating MainImage from image #{image.id}" do
          pan = MainImage.new
          pan.original_id = image.id
          pan.card_id = card.id
          add_image(pan, image)
          pan.save!
        end
      else
        say "Skipping MainImage from image #{image.id} (present)"
      end
    end
  end

  def create_pan_from_slide(slide)
    pan = new_pan(slide)
    unless pan.class.send(:find_by_original_id, slide.id).present?
      say_with_time "Creating #{pan.class.name} from slide #{slide.id}" do
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
    else
      say "Skipping pan from slide #{slide.id} (present)"
    end
  end

  def add_image(pan, image)
    if image
      filename = image.filename.url
      path = File.join(Dir.getwd, 'public', filename)
      if File.exist?(path)
        puts "Uploading image #{filename}"
        pan.file = File.open(path)
        pan.content_type = image.content_type
        pan.size = image.size
        pan.width = image.width
        pan.height = image.height
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
