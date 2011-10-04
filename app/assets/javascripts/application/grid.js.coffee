
scrollTime = 0
scrollSize = 30000

$ ->
    $("#wrapper").animate { scrollLeft: scrollSize }, scrollTime, "swing", ->
      $("#time-panel").fadeIn()

