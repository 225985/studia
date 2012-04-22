$ ->
  $("ul.fractals a").click (e) ->
    e.preventDefault()
    e.stopPropagation()

    latitude   = $("#fractal").data('latitude') ? 79.2
    longtitude = $("#fractal").data('longtitude') ? 45
    zoom       = $("#fractal").data('zoom') ? 4

    kind = $(this).data("kind") ? "mandelbrot"
    quality = $(this).data("quality") ? 1000

    window.map ||= new L.Map 'fractal', {
      center: new L.LatLng(latitude, longtitude)
      zoom: zoom
    }

    if window.layer
      window.map.removeLayer(window.layer)

    window.layer = new L.TileLayer "http://localhost:9000/#{kind}/#{quality}/{x}/{y}/{z}", attribution: "Fractal Explorer",
                                                                                    maxZoom: 100,
                                                                                    tileSize: 64

    window.map.addLayer(window.layer)

    if $("#fractal").data('id')?
      map.on "moveend", (event) ->
        c = map.getCenter()
        z = map.getZoom()
        $.post '/update', user: {latitude: c.lat, longtitude: c.lng, zoom: z}

