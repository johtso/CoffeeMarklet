CoffeeMarkup
============

A little module for converting CoffeeScript to a bookmarklet.

What it does
------------

1. Compiles the CoffeeScript to Javascript using coffee-script.js
2. Minifies the code using Google's [Closure Compiler](http://closure-compiler.appspot.com/home) (Simple mode)
3. Wraps the code for use as a bookmarklet, optionally with [clever stuff by Ben Alman](http://benalman.com/projects/run-jquery-code-bookmarklet/) for loading jQuery.

Usage
-----

    coffeemarklet(coffeescript, callback, [add_jquery, [jquery_version]])

`coffeescript` - String - The CoffeeScript to be converted
`callback` - Function - The callback that will be passed the resulting bookmarklet.
`add_jquery` - Boolean - If true wraps the function in code adding jQuery to the page. Defaults to true.
`jquery_version` - String - The minimum jQuery version to be loaded.