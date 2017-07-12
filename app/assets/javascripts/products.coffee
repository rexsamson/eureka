$(document).ready ->
  $('#product_1, #product_2, #product_3, #product_4, #product_5, #product_6, #product_7, #product_8').change ->
    concatenated_string = $('#product_1 option:selected').text() + $('#product_2 option:selected').text() + $('#product_3 option:selected').text() + $('#product_4 option:selected').text() + $('#product_5 option:selected').text() + $('#product_6 option:selected').text() + $('#product_7').val() + $('#product_8 option:selected').text()
    $('#product_code').val concatenated_string
    return
  $('#product_8').change ->
    concatenated_string = $('#product_8 option:selected').text()
    $('#product_kw').val concatenated_string
    return
  return
