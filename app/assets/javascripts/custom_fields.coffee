  $(document).on "change", "#custom_field_field_type", ->
    selected = $(this).find('option:selected').text()
    if selected == "combo_box"
      $(".combo-option").show()
    else
      $(".combo-option").hide()
      
