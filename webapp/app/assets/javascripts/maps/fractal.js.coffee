$ ->
  if $("#fractal").size() > 0
    latitude   = $("#fractal").data('latitude') ? 0
    longtitude = $("#fractal").data('longtitude') ? 0
    zoom       = $("#fractal").data('zoom') ? 3

    map = new L.Map 'fractal'
    layer = new L.TileLayer "http://ec2-107-20-61-228.compute-1.amazonaws.com/img/{x}/{y}/{z}",
                            attribution: "Fractal Explorer", maxZoom: 100
    map.addLayer layer
    map.setView new L.LatLng(latitude, longtitude), zoom

    if $("#fractal").data('id')?
      map.on "moveend", (event) ->
        c = map.getCenter()
        z = map.getZoom()
        $.post '/update', user: {latitude: c.lat, longtitude: c.lng, zoom: z}

