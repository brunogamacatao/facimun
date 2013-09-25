#= require jquery.rating.pack.js
#= require jquery.maskedinput.min.js
$ ->
  $('.telefone').mask('(99)9999-9999')
  $('.data').mask('99/99/9999')
  $('.cpf').mask('999.999.999-99')
  $('.cep').mask('99999-999')
  $('.codigo_anet_a').hide()
  $('.codigo_anet_b').hide()
  $('.matricula').hide()
  $('.socio_anet_a').change -> 
    $('.codigo_anet_a').toggle()
  $('.socio_anet_b').change -> 
    $('.codigo_anet_b').toggle()
  $('.aluno_facisa').change ->
    $('.matricula').toggle()
  
  mostra_esconde_dados()
  
  $('#inscricao_comite_id').change ->
    mostra_esconde_dados()

mostra_esconde_dados = ->
  valor = parseInt($('#inscricao_comite_id').val())
  if valor == 1
    $('#dados_embraer').show()
    $('#dados_seguranca').hide()
  else if valor == 2
    $('#dados_embraer').hide()
    $('#dados_seguranca').show()
  else
    $('#dados_embraer').hide()
    $('#dados_seguranca').hide()
  