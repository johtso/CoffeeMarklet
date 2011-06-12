root = exports ? this

class CoffeeMarklet
    compile: (cs, callback, add_jquery = true, jquery_version = '1.6.1') ->
        js = CoffeeScript.compile cs, {bare: true}

        $.post 'http://closure-compiler.appspot.com/compile',
            compilation_level: 'SIMPLE_OPTIMIZATIONS',
            output_format: 'text',
            output_info: 'compiled_code'
            js_code: js
            (compiled) =>
                bookmarklet = @makeURI($.trim(compiled), add_jquery, jquery_version)
                callback bookmarklet

    makeURI: (code, add_jquery, jquery_version) ->
        if add_jquery
            # From Ben Alman's jQuery Bookmarklet Generator http://benalman.com/projects/run-jquery-code-bookmarklet/
            """javascript:(function(e,a,g,h,f,c,b,d){if(!(f=e.jQuery)||g>f.fn.jquery||h(f)){c=a.createElement("script");c.type="text/javascript";c.src="http://ajax.googleapis.com/ajax/libs/jquery/"+g+"/jquery.min.js";c.onload=c.onreadystatechange=function(){if(!b&&(!(d=this.readyState)||d=="loaded"||d=="complete")){h((f=e.jQuery).noConflict(1),b=1);f(c).remove()}};a.documentElement.childNodes[0].appendChild(c)}})(window,document,"#{jquery_version}",function($,L){#{code}});"""
        else
            "javascript:(function(){#{code}})()"

root.coffeemarklet = new CoffeeMarklet