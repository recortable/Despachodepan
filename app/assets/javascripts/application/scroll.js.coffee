
$(document).ready ->
  Scroll.prepare()

Scroll =
  btnDown : null,
  btnUp : null,
  max : null,

  prepare : ->
    height = $("#text_flow").height();
    Scroll.max = $("#main_text").height();
    Scroll.btnDown = $("#scroll_down");
    Scroll.btnUp = $("#scroll_up");

    if (height > Scroll.max)
      Scroll.max -= 20;
      Scroll.btnDown.show();
      $("#main_text").animate({
        scrollTop: 0
      }, 0);

      $("#scroll_up").click( ->
        Scroll.up();
      )
      $("#scroll_down").click( ->
        Scroll.down();
      )

  up : -> Scroll.scroll(-1)

  down : -> Scroll.scroll(1)

  scroll : (factor) ->
    Scroll.btnDown.hide();
    Scroll.btnUp.hide();

    offset = $("#main_text").offset().top - $("#text_flow").offset().top;
    offset += factor * Scroll.max;
    offset = 0 if (offset < 0)


    $("#main_text").animate scrollTop: offset, 2000, "swing", ->
      Scroll.btnUp.show() if (offset > 0)
      newOffset = $("#main_text").offset().top - $("#text_flow").offset().top
      Scroll.btnDown.show() if newOffset == offset
