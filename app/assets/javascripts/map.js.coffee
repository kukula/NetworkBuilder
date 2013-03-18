class NetworkMap 
  constructor: (element) ->
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