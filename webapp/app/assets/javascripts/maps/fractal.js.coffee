$ ->
  if $("#fractal").size() > 0
    latitude   = $("#fractal").data('latitude') ? 0
    longtitude = $("#fractal").data('longtitude') ? 0
    zoom       = $("#fractal").data('zoom') ? 3

    map = new L.Map 'fractal'
    # layer = new L.TileLayer "http://{s}.mandelbrot.dev/api/{z}/{x}/{y}.png",
    layer = new L.TileLayer "http://192.168.0.12:9000/img/{x}/{y}/{z}",
                            attribution: "Fractal Explorer", maxZoom: 100
    map.addLayer layer
    map.setView new L.LatLng(latitude, longtitude), zoom

    if $("#fractal").data('id')?
      map.on "moveend", (event) ->
        c = map.getCenter()
        z = map.getZoom()
        $.post '/update', user: {latitude: c.lat, longtitude: c.lng, zoom: z}

