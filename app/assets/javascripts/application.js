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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require_tree .



$(document).ready(function() {
    $('select').material_select();
});


//mainpage
$( document ).ready(function() {
    if ($(".joseph_sign").length){
        $(".main_logo").hide();
    }
    else{
        $(".main_logo").fadeIn(3000);
    }
    $(".joseph_sign").fadeIn(6000);
    $("h5").each(function(index) {
        $(this).delay(800*index).fadeIn(10000);
    });


    $(".category_list").hide();
    $(".selfbutton").hide();
    $(".mouse_over").mouseenter(function(){
        $(".selfbutton").fadeIn(1000);
    })

    $(".main_logo").mouseenter(function(){
        if ($('.category_list').is(':animated')) return false;
        $(".category_list").fadeIn(1000);
    })

    $(".main_logo").mouseleave(function(){
        $(".category_list").fadeOut(1000);
    })

});



//input_form
$( document ).ready(function() {
    $('#textarea1').trigger('autoresize');
});

$( window ).load(function() {
    $('#textarea1').trigger('autoresize');
});




// IMAGE SHOW FORM
$( document ).ready(function() {
    set_firstscreen();
    set_main();
    fade_firstscreen();
});


function fade_firstscreen(){
    $(".firstscreen img").animate({
        opacity:1,
    },3000,function(){

    })
}

function fade_main(){
    $(".grid ul li img").each(function(index){
        $(this).delay(100*index).animate({
            opacity:1,
        },5000,function(){

        })
    })
}


function set_firstscreen() {
    $(".firstscreen img").css({
        position:"absolute",
        height:$(window).height(),
        opacity:0,
    });

    $(".firstscreen img").css({
        left:$(window).width()/2 - $(".firstscreen img").width() / 2
    })
}

function set_main(){
    $(".main_photo").css({
        position:"absolute",
        top:$(window).height()+50,
        left:0,
    })

    $("li img").each(function(){
        $(this).css({
            width:$(window).width()/4 - 25,
        })
    })

    x = [0,0,0,0];
    $(".grid ul li").each(function(index){
        $(this).css({
            left:$(window).width()/4 * (index%4),
            top:x[index%4]
        })

        x[index%4] = x[index%4] + $(this).find($("img")).height() + 25;

    });}


//This is when scroll is goin down to main photo
var options = [
    {selector: '#staggered-test2', offset: 400, callback: function(el) { fade_main() } },
]

Materialize.scrollFire(options);


//when you click image

var selector = '.grid li'
var selected = false
var origin_width = null
$(selector).on('click', function(){
    if(!selected){
        $(selector).removeClass('active');
        $(this).addClass('active');
        $(this).find(".description").fadeIn(3000);
        zoomImg($(this).children());
    }

    if(selected){
        $(selector).removeClass('active');
        resetImg($(this).children())
        $(this).find(".description").hide();
    }
    selected = !selected

});



//

$(".grid ul li img").on("click",function(){
})


function zoomImg(el){
    origin_width = el.width();
    el.css({
        width:$(window).width()/2,
        opacity:0,
    })

    el.css({
        "padding-top":($(window).height() - el.height())/2,
    })

    el.animate({
        opacity:1,
    },3000,function(){

    })

}



function resetImg(el){
    el.css({
        width:origin_width,
        "padding-top":0,
    })

}
