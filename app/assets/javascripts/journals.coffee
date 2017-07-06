$(document).ready ->
  $('form').on 'click', '.add_fields', (event) ->
    $('.ledgerbutton').prop 'disabled', true
    $('.price').keyup ->
      sum1 = 0
      sum2 = 0
      $(this).closest('tr.ledger').find('input[rel=\'pricec\']').val '0'
      $('.price').each ->
        price1 = $(this).val().replace('.', '')
        sum1 += parseInt(price1)
        return
      $('.pricec').each ->
        price2 = $(this).val().replace('.', '')
        sum2 += parseInt(price2)
        return
      $('#total').val sum1
      if sum1 == sum2
        $('.ledgerbutton').prop 'disabled', false
      else
        $('.ledgerbutton').prop 'disabled', true
      return
    $('.pricec').keyup ->
      sum1c = 0
      sum2c = 0
      $(this).closest('tr.ledger').find('input[rel=\'price\']').val '0'
      $('.pricec').each ->
        price2c = $(this).val().replace('.', '')
        sum2c += parseInt(price2c)
        return
      $('.price').each ->
        price1c = $(this).val().replace('.', '')
        sum1c += parseInt(price1c)
        return
      $('#total').val sum2c
      if sum1c == sum2c
        $('.ledgerbutton').prop 'disabled', false
      else
        $('.ledgerbutton').prop 'disabled', true
      return
    return
  $('.ledgerbutton').prop 'disabled', true
  $('.price').keyup ->
    sum1 = 0
    sum2 = 0
    $(this).closest('tr.ledger').find('input[rel=\'pricec\']').val '0'
    $('.price').each ->
      price1 = $(this).val().replace('.', '')
      sum1 += parseInt(price1)
      return
    $('.pricec').each ->
      price2 = $(this).val().replace('.', '')
      sum2 += parseInt(price2)
      return
    $('#total').val sum1
    if sum1 == sum2
      $('.ledgerbutton').prop 'disabled', false
    else
      $('.ledgerbutton').prop 'disabled', true
    return
  $('.pricec').keyup ->
    sum1c = 0
    sum2c = 0
    $(this).closest('tr.ledger').find('input[rel=\'price\']').val '0'
    $('.pricec').each ->
      price2c = $(this).val().replace('.', '')
      sum2c += parseInt(price2c)
      return
    $('.price').each ->
      price1c = $(this).val().replace('.', '')
      sum1c += parseInt(price1c)
      return
    $('#total').val sum2c
    if sum1c == sum2c
      $('.ledgerbutton').prop 'disabled', false
    else
      $('.ledgerbutton').prop 'disabled', true
    return
  $('form').on 'click', '[data-apply~="confirmation"]', (event) ->
    $('.ledgerbutton').prop 'disabled', true
    sum1 = 0
    sum2 = 0
    $(this).closest('tr.ledger').find('input[rel=\'pricec\']').val '0'
    $(this).closest('tr.ledger').find('input[rel=\'price\']').val '0'
    $('.price').each ->
      price1 = $(this).val().replace('.', '')
      sum1 += parseInt(price1)
      return
    $('.pricec').each ->
      price2 = $(this).val().replace('.', '')
      sum2 += parseInt(price2)
      return
    $('#total').val sum1
    if sum1 == sum2
      $('.ledgerbutton').prop 'disabled', false
    else
      $('.ledgerbutton').prop 'disabled', true
    return
  return