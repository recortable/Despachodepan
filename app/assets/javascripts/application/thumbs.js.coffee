# Implements thumb fetching at index card

# cache contents
cache = []

# the currently visible element id
currentId = null

# the preview element to insert the thumb html into
preview = null;

# show the preview box
showPreview = (id, box) ->
  return if currentId != id # you get too late, baby!
  left = parseInt(box.css('left')) + 12
  top = parseInt(box.css('top')) - 3
  top -= preview.height() - 13 if top > 240

  preview.css('left', left);
  preview.css('top', top);
  preview.show();
  # After show, to calculate the image width
  image_width = $('#preview_image').width();
  $('.mini_text').width(image_width);

# hide the preview box
hidePreview = ->
  currentId = null
  preview.hide()


# load preview: load the html into the preview element. Do the caching
loadPreview = (id, callback) ->
  if cache[id]
    preview.html(cache[id])
    callback()
  else
    requestThumbnail id, (response) ->
      cache[id] = response
      preview.html(cache[id])
      img = new Image()
      img.onload = () -> callback()
      img.src = $('#preview_image').attr('src')


# request thumb: do the ajax and img preloading stuff
requestThumbnail = (id, callback) ->
  cardId = id.split('-')[1]
  preview.load "/thumb/" + cardId, (response, status) ->
    callback(response) if (status == 'success')


$ ->
  preview = $('#preview');

  $(".preview").hover(->
    box = $(this)
    currentId = box.attr('id')
    loadPreview currentId, ->
      showPreview(currentId, box)
  ,->
    hidePreview()
  )
