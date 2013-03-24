class NetworkMap
  constructor: (selector) ->
    @element = $(selector)
    @render()
    @initialize_infowindow()
    @prepare_networks()
    @prepare_locations()
    @bind_events()

  prepare_networks: ->
    @networks = new Collection Network, 'network', this

  prepare_locations: ->
    @locations = new Collection Location, 'location', this

  initialize_infowindow: ->
    @infowindow = new google.maps.InfoWindow()

  close_infowindow: ->
    @infowindow.close()

  render: ->
    mapOptions =
      zoom: 12
      mapTypeId: google.maps.MapTypeId.ROADMAP
      zoomControlOptions:
        style: google.maps.ZoomControlStyle.SMALL
        position: google.maps.ControlPosition.TOP_LEFT
      streetViewControl: false
      scaleControl: false
      mapTypeControl: false
    @gmap = new google.maps.Map @element[0], mapOptions
    @set_center()

  set_center: ->
    if sessionStorage? and sessionStorage.user_lat? and sessionStorage.user_lng?
      @gmap.setCenter new google.maps.LatLng(sessionStorage.user_lat, sessionStorage.user_lng)
    else
      if navigator.geolocation?
        current_position_callback = (position) =>
          sessionStorage.user_lat = position.coords.latitude
          sessionStorage.user_lng = position.coords.longitude
          @gmap.setCenter new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
        navigator.geolocation.getCurrentPosition current_position_callback
      else
        @gmap.setCenter new google.maps.LatLng 49.832, 24.022

  bind_events: ->
    $('#add_network_btn').click (e) =>
      @networks.add()
    $('#save_network').click (e) =>
      @networks.save()
    $('body').on 'click', '.edit_network', (e) =>
      @networks.edit $(e.target).data 'network-id'
    $('body').on 'click', '.delete_network', (e) =>
      @networks.delete $(e.target).data 'network-id'
    $('#add_location_btn').click (e) =>
      @locations.add()
    $('#save_location').click (e) =>
      @locations.save()
    $('body').on 'click', '.edit_location', (e) =>
      @locations.edit $(e.target).data 'location-id'
    $('body').on 'click', '.delete_location', (e) =>
      @locations.delete $(e.target).data 'location-id'

window.NetworkMap = NetworkMap

class Collection
  constructor: (@klass, @name, @map) ->
    @collection = []
    $.getJSON @url(), (data) =>
      for item in data
        if @name == 'network'
          @collection.push new @klass(@map, item.id, item.name, item.description, item.color, item.capacity, item.points)
        else if @name == 'location'
          @collection.push new @klass(@map, item.id, item.name, item.description, item.lat, item.lng, item.icon)
      true

  url: (id) ->
    if id?
      "/#{@name}s/#{id}.json"
    else
      "/#{@name}s.json"

  add: ->
    @current = new @klass @map
    @open_form()

  find: (id) ->
    _.find @collection, (item) ->
      item.id == id

  edit: (id) ->
    @map.close_infowindow()
    @save() if @current?
    item = @find id
    if item?
      @current = item
      @current.edit()
      @open_form()

  delete: (id)->
    @map.close_infowindow()
    @save() if @current?
    @current = null
    item = @find id
    if item?
      data =
        _method: 'DELETE'
      $.post @url(item.id), data, (answer) =>
        @collection = _.without @collection, item
        item.delete()

  save: ->
    data = @current.save()
    data._method = 'PATCH' if @current.id?
    $.post @url(@current.id), data, (answer) =>
      @close_form()
      unless @current.id?
        @current.id = answer.id
        @collection.push @current
      @current = null

  open_form: ->
    $("##{@name}_name").val @current.name
    $("##{@name}_description").val @current.description
    $("##{@name}_color").val @current.color
    $("##{@name}_capacity").val @current.capacity
    $("##{@name}_icon").val @current.icon
    $("#add_#{@name}").show()
    $("#add_#{@name}_btn").hide()

  close_form: ->
    $("#add_#{@name}").hide()
    $("#add_#{@name}_btn").show()

class Network
  constructor: (@map, @id, @name, @description, @color='#33ff00', @capacity=5, points) ->
    @klass_name = 'network'
    options =
      strokeColor: @color
      strokeOpacity: .7
      strokeWeight: @capacity
    if points?
      options.path = @set_path(points)
      options.editable = false
      @data_to_form()
    else
      options.path = @new_path()
      options.editable = true
      @bind_edit_events()
    @gpolyline = new google.maps.Polyline options
    @gpolyline.setMap @map.gmap
    @bind_infowindow()
    this

  bind_infowindow: ->
    google.maps.event.clearListeners @gpolyline, 'click'
    google.maps.event.addListener @gpolyline, 'click', (e) =>
      content = """
        <h4>#{@name}</h4>
        <p>Capacity: #{@capacity}</p>
        <p>Description: #{@description}</p>
        <p>
          <a class='edit_network btn btn-mini btn-primary' data-network-id='#{@id}'>Edit</a>
          <a class='delete_network btn btn-mini btn-danger' data-network-id='#{@id}'>Delete</a>
        </p>
      """
      @map.infowindow.setContent content
      @map.infowindow.setPosition e.latLng
      @map.infowindow.open @map.gmap

  set_path: (points) ->
    $.map points, (point) ->
      new google.maps.LatLng point.lat, point.lng

  new_path: ->
    [@map.gmap.getCenter(), @map.gmap.getCenter()]

  bind_edit_events: ->
    $('body').off 'change', "##{@klass_name}_name, ##{@klass_name}_description, ##{@klass_name}_color, ##{@klass_name}_capacity"
    $('body').on 'change', "##{@klass_name}_name, ##{@klass_name}_description, ##{@klass_name}_color, ##{@klass_name}_capacity", (e) =>
      @data_from_form()

  data_from_form: ->
    @color = $("##{@klass_name}_color").val()
    @capacity = $("##{@klass_name}_capacity").val()
    @name = $("##{@klass_name}_name").val()
    @description = $("##{@klass_name}_description").val()
    if @gpolyline?
      @gpolyline.setOptions
        strokeColor: @color
        strokeWeight: @capacity

  data_to_form: ->
    $("##{@klass_name}_color").val(@color)
    $("##{@klass_name}_capacity").val(@capacity)
    $("##{@klass_name}_name").val(@name)
    $("##{@klass_name}_description").val(@description)

  edit: ->
    @bind_edit_events()
    @gpolyline.setOptions
      editable: true
      strokeOpacity: .5

  delete: ->
    @gpolyline.setVisible false

  save: ->
    @data_from_form()
    @gpolyline.setOptions
      editable: false
      strokeOpacity: .7
    @bind_infowindow()
    points = []
    @gpolyline.getPath().forEach (point) =>
      points.push
        lat: point.lat()
        lng: point.lng()
    data =
      network:
        name: @name
        description: @description
        color: @color
        capacity: @capacity
        points_attributes: points
    data


class Location
  constructor: (@map, @id, @name, @description, @lat, @lng, @icon) ->
    @klass_name = 'location'
    if @lat? and @lng?
      position = new google.maps.LatLng @lat, @lng
      draggable = false
    else
      @bind_edit_events()
      position = @map.gmap.getCenter()
      draggable = true
      icons = ['chair','cup_coffee','laptop','motherboard','server','web_camera','coffee_machine','hard_disk','monitor','print','user']
      @icon = _.first _.shuffle icons
    @gicon = new google.maps.MarkerImage(image_path("#{@icon}.png"),null,null,null,(new google.maps.Size 48, 48))
    @gmarker = new google.maps.Marker
      map: @map.gmap
      position: position
      draggable: draggable
      icon: @gicon

    @data_to_form()
    @bind_infowindow()
    this

  bind_infowindow: ->
    google.maps.event.clearListeners @gmarker, 'click'
    google.maps.event.addListener @gmarker, 'click', (e) =>
      content = """
        <h4>#{@name}</h4>
        <p>Description: #{@description}</p>
        <p>
          <a class='edit_location btn btn-mini btn-primary' data-location-id='#{@id}'>Edit</a>
          <a class='delete_location btn btn-mini btn-danger' data-location-id='#{@id}'>Delete</a>
        </p>
      """
      @map.infowindow.setContent content
      @map.infowindow.open @map.gmap, @gmarker

  bind_edit_events: ->
    $('body').off 'change', "##{@klass_name}_name, ##{@klass_name}_description, ##{@klass_name}_icon"
    $('body').on 'change', "##{@klass_name}_name, ##{@klass_name}_description, ##{@klass_name}_icon", (e) =>
      @data_from_form()

  data_from_form: ->
    @icon = $("##{@klass_name}_icon").val()
    @name = $("##{@klass_name}_name").val()
    @description = $("##{@klass_name}_description").val()

  data_to_form: ->
    $("##{@klass_name}_icon").val(@icon)
    $("##{@klass_name}_name").val(@name)
    $("##{@klass_name}_description").val(@description)

  edit: ->
    @bind_edit_events()
    @gmarker.setOptions
      draggable: true

  delete: ->
    @gmarker.setVisible false

  save: ->
    @data_from_form()
    @gmarker.setOptions
      draggable: false
    @bind_infowindow()
    data =
      location:
        name: @name
        description: @description
        icon: @icon
        lat: @gmarker.position.lat()
        lng: @gmarker.position.lng()
    data

