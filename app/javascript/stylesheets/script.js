   // app/javascript/stylesheets/script.js
document.addEventListener("turbolinks:load", function() {
  $('.slider').slick({
    autoplay: true,
    infinite: true,
    
 
speed: 500,
    slidesToShow: 3,
    
slidesToScroll: 1,
    prevArrow: '<div class="slick-prev"></div>',
    
nextArrow: '<div class="slick-next"></div>',
    centerMode: true,
    
variableWidth: true,
    dots: true,
  });
});

document.addEventListener("turbolinks:load", function() {
  $('.slider2').slick({
    autoplay: true,
    infinite: true,
    
 
speed: 500,
    slidesToShow: 3,
    
slidesToScroll: 1,
    prevArrow: '<div class="slick-prev"></div>',
    
nextArrow: '<div class="slick-next"></div>',
    centerMode: true,
    
variableWidth: true,
  });
});

document.addEventListener("turbolinks:load", function() {
  $('.slider3').slick({
    infinite: true,
    
 
speed: 500,
    slidesToShow: 3,
    
slidesToScroll: 1,
    prevArrow: '<div class="slick-prev"></div>',
    
nextArrow: '<div class="slick-next"></div>',
    centerMode: true,
    
variableWidth: true,
  });
});