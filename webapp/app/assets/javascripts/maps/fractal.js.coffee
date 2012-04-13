$ ->
  if $("#fractal").size() > 0
    map = new L.Map 'fractal'
    popup = new L.Popup

    layer = new L.TileLayer "http://{s}.mandelbrot.dev/api/{z}/{x}/{y}.png",
                            attribution: "Fractal Explorer"
    map.addLayer layer
    map.setView new L.LatLng(0, 0), 3

    map.on "click", (event) ->
      description = "Clicked at #{event.latlng.lat.toFixed 2}, #{event.latlng.lng.toFixed 2}"
      popup.setLatLng event.latlng
      popup.setContent description
      map.openPopup popup

