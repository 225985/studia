$ ->
  if $("#fractal").size() > 0
    latitude   = $("#fractal").data('latitude') ? 0
    longtitude = $("#fractal").data('longtitude') ? 0
    zoom       = $("#fractal").data('zoom') ? 3

    map = new L.Map 'fractal'
    # layer = new L.TileLayer "http://{s}.mandelbrot.dev/api/{z}/{x}/{y}.png",
    layer = new L.TileLayer "http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/997/256/{z}/{x}/{y}.png",
                            attribution: "Fractal Explorer", maxZoom: 20
    map.addLayer layer
    map.setView new L.LatLng(latitude, longtitude), zoom

    if $("#fractal").data('id')?
      map.on "moveend", (event) ->
        c = map.getCenter()
        z = map.getZoom()
        $.post '/update', user: {latitude: c.lat, longtitude: c.lng, zoom: z}

