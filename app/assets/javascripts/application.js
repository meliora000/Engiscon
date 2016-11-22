// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery2
//= require jquery_ujs
//= require materialize/dist/js/materialize
//= require plyr/dist/plyr










$(document).ready(function () {
    //BASIC SETUP
    $('.button-collapse').sideNav();
    $('.parallax').parallax();

    //APPLICATION
    $("#user-switch").mouseenter(function(){
        $("#user-name").animateCss("fadeOutUp")
        $("#user-sign").animateCss("fadeInUp")
    })

    $("#user-switch").mouseleave(function(){
        $("#user-sign").animateCss("fadeOutUp")
        $("#user-name").animateCss("fadeInUp")
    })
});

$.fn.extend({
    animateCss: function (animationName) {
        var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
        if (animationName.indexOf("Out") == -1) {
            $(this).show()
            $(this).addClass('animated ' + animationName).one(animationEnd, function () {
                $(this).removeClass('animated ' + animationName);
            });
        }
        else {
            $(this).addClass('animated ' + animationName).one(animationEnd, function () {
                $(this).removeClass('animated ' + animationName);
                $(this).hide();
            });
        }
    }
});