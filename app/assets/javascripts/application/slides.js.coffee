# Slides in cards

# visible image number
visible = -1

# The image text box element
text_box = null

$ ->
  text_box = $("#slide_text");
  imageCount = $("#slides .slide").size();

  $(window).bind 'hashchange', (e) ->
    showImage(currentImageNumber())

  $("#slidePrev").click ->
    current = currentImageNumber();
    triggerImage(current -1) if current > 1
    return false;

  $("#slideNext").click ->
    current = currentImageNumber();
    triggerImage(current + 1) if current < imageCount
    return false;

  $(window).trigger('hashchange');

# currentImageNumber
currentImageNumber = ->
  link = $.param.fragment();
  number = if link.match(/^\/imagen=\d+/) then parseInt(link.substring(8)) else 1
  return number

# triggetImage
triggerImage = (number) ->
  $.bbq.pushState("#/imagen=" + number)

# showImage
showImage = (number) ->
  return if (number == visible) # no need to change anything

  $("#showImage" + visible).removeClass('selected');
  $("#slideImage" + visible).hide();
  text_box.hide();

  visible = number;

  image = $("#slideImage"+ number);
  comment = image.attr('alt');
  comment = '' if !comment
  text_box.text(comment);
  w = image.width();
  margin = (415 - w) / 2;
  text_box.width(w);
  text_box.css('margin-left', margin);
  image.fadeIn("slow");
  $('#number_control').text(number);
  text_box.fadeIn("slow");
  $("#showImage" + number).addClass('selected');


