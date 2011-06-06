CoffeeMarklet
============

A little module for converting CoffeeScript to a bookmarklet.

What it does
------------

1. Compiles the CoffeeScript to Javascript using coffee-script.js
2. Minifies the code using Google's [Closure Compiler](http://closure-compiler.appspot.com/home) (Simple mode)
3. Wraps the code for use as a bookmarklet, optionally with [clever stuff by Ben Alman](http://benalman.com/projects/run-jquery-code-bookmarklet/) for loading jQuery.

Usage
-----

The easiest way is to just use the tool here: [http://johtso.github.com/CoffeeMarklet/](http://johtso.github.com/CoffeeMarklet/)

- - -

    coffeemarklet(coffeescript, callback, [add_jquery, [jquery_version]])

`coffeescript` - String - The CoffeeScript to be converted.

`callback` - Function - The callback that will be passed the resulting bookmarklet.

`add_jquery` - Boolean - If true wraps the function in code adding jQuery to the page. Defaults to true.

`jquery_version` - String - The minimum jQuery version to be loaded.

Example
-------

**Source CoffeeScript:**

    alert ('Hello' for i in [0..5]).join(', ')

**Resulting bookmarklet without jQuery:**

    javascript:(function(){var a;alert(function(){var b;b=[];for(a=0;a<=5;a++)b.push("Hello");return b}().join(", "))}).call(this);

**And with jQuery:**
<pre>
javascript:(function(e,a,g,h,f,c,b,d){if(!(f=e.jQuery)||g>f.fn.jquery||h(f)){c=a.createElement("script");c.type="text/javascript";c.src="http://ajax.googleapis.com/ajax/libs/jquery/"+g+"/jquery.min.js";c.onload=c.onreadystatechange=function(){if(!b&&(!(d=this.readyState)||d=="loaded"||d=="complete")){h((f=e.jQuery).noConflict(1),b=1);f(c).remove()}};a.documentElement.childNodes[0].appendChild(c)}})(window,document,"1.6.1",function($,L){alert("CoffeeScript and jQuery "+$.fn.jquery+"!");});
</pre>