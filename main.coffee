$ ->
    $('#src_show')[0].reset()
    
    bookmarklet = $('#bm_button')
    bm_div = $('#bookmarklet')

    if not $('#jq_check').is(':checked')
        $('#jq_ver_box').hide()

    $('#jq_check').change ->
        $('#jq_ver_box').slideToggle()
    
    $('#src_check').change ->
        $('#output-area').slideToggle()
        
    $('#gen-button').click ->
        if bm_div.is(':visible')
            bm_div.fadeOut('slow')
            @refreshing = true
            
        jquery_include = $('#jq_check').is(':checked')
        cs = $('#input').val()
        jquery_version = $('#jq_ver').val()
        callback = (uri) =>
            $('#output').val(uri)
            if not @refreshing
                bookmarklet.attr('href', uri)
                bm_div.slideDown('slow')
            else
                bookmarklet.attr('href', uri)
                bm_div.fadeIn('slow')
        
        coffeemarklet.compile cs, callback, jquery_include, jquery_version