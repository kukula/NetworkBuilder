jQuery ->
  if $('#map').length > 0
    new NetworkMap '#map'

class NetworkMap 
  constructor: (element) ->
    @render(element)
    @bind_events()

  render: (element) ->
    mapOptions = 
      center: new google.maps.LatLng(-34.397, 150.644)
      zoom: 10
      mapTypeId: google.maps.MapTypeId.ROADMAP

    @map = new google.maps.Map $(element)[0], mapOptions

    flightPlanCoordinates = [
      new google.maps.LatLng(37.772323, -122.214897),
      new google.maps.LatLng(21.291982, -157.821856),
      new google.maps.LatLng(-18.142599, 178.431),
      new google.maps.LatLng(-27.46758, 153.027892)
    ]
    flightPath = new google.maps.Polyline
      path: flightPlanCoordinates
      strokeColor: '#FF0000'
      strokeOpacity: 1.0
      strokeWeight: 2

    flightPath.setMap @map

  bind_events: ->
    $('.add_point').click (e) =>
      @add_point()


  add_point: () ->
    console.log "aaa"
    start_link = new google.maps.Marker
      position: @map.getCenter()
      map: @map
      draggable: true

    end_link = new google.maps.Marker
      position: @map.getCenter()
      map: @map
      draggable: true

    link = new google.maps.Polyline
      path: [start_link.position, end_link.position]
      strokeColor: "#FFFF00"
      strokeOpacity: .7
      strokeWeight: 7

    link.setMap @map

    google.maps.event.addListener start_link, 'drag', ->
      link.setPath [start_link.getPosition(), end_link.getPosition()]

    