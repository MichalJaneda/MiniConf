# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->

  $('.datetimepicker').datetimepicker({format: 'YYYY-MM-DD HH:mm'})

  mapHandler = Gmaps.build('Google')
  mapHandler.buildMap {provider: {}, internal: {id: 'conference_edit_map'}},
    ->
      google.maps.event.addListener mapHandler.getMap(), 'center_changed', ->
        null

      mapHandler.map.centerOn {lat: 52, lng: 18}

      if navigator.geolocation
        navigator.geolocation.getCurrentPosition (position) ->
          mapHandler.map.centerOn {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          }

  google.maps.event.trigger mapHandler.getMap(), 'center_changed'
  mapHandler.fitMapToBounds()

