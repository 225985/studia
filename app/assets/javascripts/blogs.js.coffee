$ ->

  if $("#blog_kind").val() == ''
    $("#blog_kind").val("Blog")

  $("#blog_kind option[value='']").remove()

  if $("#blog_kind").val() == "Discussion"
    $(".blog-public").show()
  
  if $('#blog_public').attr('checked') == false
    $("#invite-button").show()


  $("#blog_kind").change (e) ->
    e.preventDefault()
    e.stopPropagation()

    if $(this).val() == "Discussion"
      $(".blog-public").show("slow")
    else
      $("#blog_public").attr('checked', false)
      $(".blog-public").hide("slow")


  $("#blog_public").change (e) ->
    e.preventDefault()
    e.stopPropagation()

    if $(this).attr('checked') == false
      $("#invite-button").show("slow")
    else
      $("#invite-button").hide("slow")

  $('a[rel*=facebox]').facebox() 
