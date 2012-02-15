# Show or hides projects based on selected tags
# at GRID
tagToCardIDs = {}

activateTag = (id) ->
  indicator = $("#ind-#{id}")
  indicator.toggleClass('active')
  color = if indicator.hasClass('active') then indicator.css('color') else "white"
  indicator.css('background-color', color)

showActiveProjects = ->
  active = $("#tags .active")

  if active.length == 0
    $("#grid .card").removeClass('hide').fadeIn()
  else
    $("#grid .card").addClass('hide')
    $.each active, ->
      id = $(this).attr('id').substring(4);
      cardIds = tagToCardIDs[id]
      $.each cardIds, ->
        $(".card#{this}").removeClass('hide').fadeIn()

    $(".card.hide").fadeOut(500);


$ ->
  $("#tags li.tag").each ->
    id = $(this).attr('id').substring(4)
    card_ids = $(this).data('card-ids')
    tagToCardIDs[id] = eval("[#{card_ids}]")

  $("#tags .tag-link").click ->
    id = $(this).attr('id').substring(4)
    activateTag(id);
    showActiveProjects();
