//= require jquery
//= require_self
//= require ./lib/jquery.ba-bbq.min.js
//= require_directory ./application

if (typeof console == "undefined" || typeof console.log == "undefined") {
    console = {
        log : function() {
        }
    };
}
