# Slides in cards

# visible image number
current = -1

# The image text box element
text_box = null

$ ->
  text_box = $("#slide_text");
  imageCount = $("#slides .slide").size();

  showImage(1)

  $("#slideFirst").click -> showImage(1)
  $("#slideLast").click -> showImage(imageCount)
  $("#slidePrev").click -> showImage(current - 1) if current > 1
  $("#slideNext").click -> showImage(current + 1) if current < imageCount

# showImage
showImage = (index) ->
  return if (index == current)
  console.log("showImage #{index} (#{current})")

  $("#showImage" + current).removeClass('selected');
  $("#slideImage" + current).hide();
  text_box.hide();

  current = index;

  image = $("#slideImage"+ index);
  comment = image.attr('alt');
  comment = '' if !comment
  text_box.text(comment);
  w = image.width();
  margin = (415 - w) / 2;
  text_box.width(w);
  text_box.css('margin-left', margin);
  image.fadeIn("slow");
  $('#number_control').text(index);
  text_box.fadeIn("slow");
  $("#showImage" + index).addClass('selected');
  console.log("Current: #{current}")

