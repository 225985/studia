$ ->
  $("#blog_kind").change (e) ->
    e.preventDefault()
    e.stopPropagation()

    if($(this).val() == "Discussion")
      $(".blog-public").show("slow")
    else
      $("#blog_public").attr('checked', false)
      $(".blog-public").hide("slow")
    
