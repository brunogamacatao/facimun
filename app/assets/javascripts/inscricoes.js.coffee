# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#= require jquery.rating.pack.js
#= require jquery.maskedinput.min.js
$ ->
  $('.telefone').mask('(99)9999-9999')
  $('.data').mask('99/99/9999')
  $('.codigo_anet_a').hide()
  $('.codigo_anet_b').hide()
  $('.socio_anet_a').change -> 
    $('.codigo_anet_a').toggle()
  $('.socio_anet_b').change -> 
    $('.codigo_anet_b').toggle()    