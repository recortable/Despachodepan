
calc_selected_tags = ->
  selectedString = "";
  $("#tag_selector a.selected").each -> selectedString += this.id
  $("#selected").val(selectedString);

$ ->
  $("#tag_selector a").click ->
    $(this).toggleClass("selected")
    false
  $("form.edit_card").submit -> calc_selected_tags()






