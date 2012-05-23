$ ->
  $("#show-settings").click (e) ->
    $("#settings").slideDown("slow")
    $("#show-settings").hide()
    $("#hide-settings").show()

  $("#hide-settings").click (e) ->
    $("#settings").slideUp("slow")
    $("#show-settings").show()
    $("#hide-settings").hide()

