
scrollTime = 0
scrollSize = 30000

$ ->
    $(".autoscroll").animate { scrollLeft: scrollSize }, scrollTime, "swing", ->
      $("#time-panel .line").fadeIn()

