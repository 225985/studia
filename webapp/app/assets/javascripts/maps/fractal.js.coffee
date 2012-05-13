update = ->
  latitude   = $("#fractal").data('latitude') ? 0 #79.2
  longtitude = $("#fractal").data('longtitude') ? 0 #45
  zoom       = $("#fractal").data('zoom') ? 2

  kind    = $("#kind").val() ? "mandelbrot-color"
  iter    = $("#iter").val() ? 1000
  size    = $("#size").val() ? 256

  window.map ||= new L.Map 'fractal', {
    center: new L.LatLng(latitude, longtitude)
    zoom: zoom
  }

  if window.layer
    window.map.removeLayer(window.layer)

  window.layer = new L.TileLayer "http://localhost:9000/#{size}/#{kind}/#{iter}/{x}/{y}/{z}", attribution: "Fractal Explorer", maxZoom: 100, tileSize: size

  window.map.addLayer(window.layer)

  if $("#fractal").data('id')?
    map.on "moveend", (event) ->
      c = map.getCenter()
      z = map.getZoom()
      $.post '/update', user: {latitude: c.lat, longtitude: c.lng, zoom: z, kind: kind, iter: iter, size: size}

$ ->
  update()

  $("#render").click (e) ->
    e.preventDefault()
    e.stopPropagation()
    update()

