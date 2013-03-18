jQuery ->
  if $('#map').length > 0
    map = new NetworkMap '#map'

class NetworkMap 
  constructor: (selector) ->
    @element = $(selector)
    @prepare_links()
    @render()
    @render_links()
    @bind_events()

  prepare_links: ->
    @links = []
    $(@element).find('ul>li').each (_i, el) =>
      start_link = new google.maps.LatLng $(el).data('start-lat'), $(el).data('start-lng')
      end_link = new google.maps.LatLng $(el).data('end-lat'), $(el).data('end-lng')
      link = new google.maps.Polyline
        path: [start_link, end_link]
        strokeColor: $(el).data('color')
        strokeOpacity: .7
        strokeWeight: $(el).data('capacity')
      @links.push link

  render_links: ->
    for link in @links
      link.setMap @map

  bind_events: ->
    $('#add_link_btn').click (e) =>
      capacity = $('#network_link_capacity').val()
      color = $('#network_link_color').val()
      link = @add_point capacity, color
      $('#add_link').show()
      $('#add_link_btn').hide()

  render: () ->
    mapOptions = 
      center: new google.maps.LatLng(49.832, 24.022)
      zoom: 12
      mapTypeId: google.maps.MapTypeId.ROADMAP

    @map = new google.maps.Map @element[0], mapOptions


  add_point: (capacity, color) ->
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
      strokeColor: color
      strokeOpacity: .7
      strokeWeight: capacity

    link.setMap @map

    google.maps.event.addListener start_link, 'drag', ->
      link.setPath [start_link.getPosition(), end_link.getPosition()]
    google.maps.event.addListener start_link, 'dragend', ->
      $('#network_link_start_lat').val start_link.getPosition().lat()
      $('#network_link_start_lng').val start_link.getPosition().lng()

    google.maps.event.addListener end_link, 'drag', ->
      link.setPath [start_link.getPosition(), end_link.getPosition()]
    google.maps.event.addListener end_link, 'dragend', ->
      $('#network_link_end_lat').val end_link.getPosition().lat()
      $('#network_link_end_lng').val end_link.getPosition().lng()

    link



    