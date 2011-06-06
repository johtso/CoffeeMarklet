$ ->
    bookmarklet = $('#bookmarklet')

    if not $('#jq_check').is(':checked')
        $('#jq_ver_box').hide()

    $('#jq_check').change ->
        $('#jq_ver_box').slideToggle()
        
    $('#gen-button').click ->
        if bookmarklet.is(':visible')
            bookmarklet.fadeOut('slow')
            
        jquery_include = $('#jq_check').is(':checked')
        cs = $('#input').val()
        jquery_version = $('#jq_ver').val()
        callback = (uri) ->
            $('#output').val(uri)
            bookmarklet.attr('href', uri).fadeIn('slow')
        
        coffeemarklet.compile cs, callback, jquery_include, jquery_version