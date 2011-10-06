
Image.all.each do |image|
  puts image.id if image.slides.all.size == 0
end

