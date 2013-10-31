$ ->
  $('#inscricao_semana_arquitetura_evento_paralelo_ids_1').change ->
    if $(this).is(':checked')
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_2').attr("disabled", true)
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_3').attr("disabled", true)
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_4').attr("disabled", true)
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_5').attr("disabled", true)
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_6').attr("disabled", true)
      
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_2').parent().hide()
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_3').parent().hide()
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_4').parent().hide()
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_5').parent().hide()
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_6').parent().hide()
    else
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_2').removeAttr("disabled")
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_3').removeAttr("disabled")
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_4').removeAttr("disabled")
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_5').removeAttr("disabled")
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_6').removeAttr("disabled")
      
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_2').parent().show()
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_3').parent().show()
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_4').parent().show()
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_5').parent().show()
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_6').parent().show()
  
  $('#inscricao_semana_arquitetura_evento_paralelo_ids_2').change ->
    if $(this).is(':checked')
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_3').attr("disabled", true)
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_3').parent().hide()
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_4').attr("disabled", true)
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_4').parent().hide()
    else
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_3').removeAttr("disabled")
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_3').parent().show()
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_4').removeAttr("disabled")
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_4').parent().show()
  $('#inscricao_semana_arquitetura_evento_paralelo_ids_3').change ->
    if $(this).is(':checked')
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_2').attr("disabled", true)
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_2').parent().hide()
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_4').attr("disabled", true)
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_4').parent().hide()
    else
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_2').removeAttr("disabled")
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_2').parent().show()
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_4').removeAttr("disabled")
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_4').parent().show()
  $('#inscricao_semana_arquitetura_evento_paralelo_ids_4').change ->
    if $(this).is(':checked')
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_2').attr("disabled", true)
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_2').parent().hide()
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_3').attr("disabled", true)
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_3').parent().hide()
    else
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_2').removeAttr("disabled")
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_2').parent().show()
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_3').removeAttr("disabled")
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_3').parent().show()

  $('#inscricao_semana_arquitetura_evento_paralelo_ids_5').change ->
    if $(this).is(':checked')
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_6').attr("disabled", true)
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_6').parent().hide()
    else
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_6').removeAttr("disabled")
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_6').parent().show()
  $('#inscricao_semana_arquitetura_evento_paralelo_ids_6').change ->
    if $(this).is(':checked')
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_5').attr("disabled", true)
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_5').parent().hide()
    else
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_5').removeAttr("disabled")
      $('#inscricao_semana_arquitetura_evento_paralelo_ids_5').parent().show()
