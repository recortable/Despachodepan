require 'fileutils'


def upload(model, skip_stored = false)
  path = File.join(Dir.getwd, 'public', model.filename.url)
  puts "Uploading #{model.class.name}(#{model.id}) => #{path}"

  if skip_stored and model.stored.present?
    puts "Skipping: stored present."
  elsif File.exist?(path)
    model.stored = File.open(path)
    model.save!
    puts "Stored! #{model.stored.url}"
  else
    puts "File doesn't exists!'"
    model.stored = 'not_exist'
    model.save!
  end
end

if Rails.env.development?
  #CardFile.limit(5).each { |card_file| upload card_file }
  Image.limit(10).each { |image| upload image }
elsif Rails.env.production?
  CardFile.all.each { |card| upload(card, true) }
  Image.all.each { |image| upload(image, true) }
end
