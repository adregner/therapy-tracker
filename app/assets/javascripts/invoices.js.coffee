# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.remove_visit = (link) ->
    $(link).parent().remove()

window.update_vists = () ->
    if window.location.href.indexOf('new') < 0
        return
    alert('go get em')
