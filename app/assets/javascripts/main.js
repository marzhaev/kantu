$(document).ready(function() {

  $(".offer-wrapper").mouseenter(function() {
    $(".button-link").toggleClass("animated-button-link")
  });
  $(".offer-wrapper").mouseleave(function() {
    $(".button-link").toggleClass("animated-button-link")
  });

  $(".examples__wrapper_inspiration-one").mouseenter(function() {
    $(".examples__offer_one").addClass("examples__offer_animated")
  });
  $(".examples__wrapper_inspiration-one").mouseleave(function() {
    $(".examples__offer_one").removeClass("examples__offer_animated")
  });
  $(".examples__wrapper_inspiration-two").mouseenter(function() {
    $(".examples__offer_two").addClass("examples__offer_animated")
  });
  $(".examples__wrapper_inspiration-two").mouseleave(function() {
    $(".examples__offer_two").removeClass("examples__offer_animated")
  });
  $(".examples__wrapper_inspiration-three").mouseenter(function() {
    $(".examples__offer_three").addClass("examples__offer_animated")
  });
  $(".examples__wrapper_inspiration-three").mouseleave(function() {
    $(".examples__offer_three").removeClass("examples__offer_animated")
  });
  $(".examples__wrapper_inspiration-four").mouseenter(function() {
    $(".examples__offer_four").addClass("examples__offer_animated")
  });
  $(".examples__wrapper_inspiration-four").mouseleave(function() {
    $(".examples__offer_four").removeClass("examples__offer_animated")
  });
  $(".examples__wrapper_inspiration-five").mouseenter(function() {
    $(".examples__offer_five").addClass("examples__offer_animated")
  });
  $(".examples__wrapper_inspiration-five").mouseleave(function() {
    $(".examples__offer_five").removeClass("examples__offer_animated")
  });
  $(".examples__wrapper_inspiration-six").mouseenter(function() {
    $(".examples__offer_six").addClass("examples__offer_animated")
  });
  $(".examples__wrapper_inspiration-six").mouseleave(function() {
    $(".examples__offer_six").removeClass("examples__offer_animated")
  });


  $(".solutions__wrapper_one").mouseenter(function() {
    $(".services__image_one").addClass("animated-image")
  });
  $(".solutions__wrapper_one").mouseleave(function() {
    $(".services__image_one").removeClass("animated-image")
  });

  $(".solutions__wrapper_two").mouseenter(function() {
    $(".services__image_two").addClass("animated-image")
  });
  $(".solutions__wrapper_two").mouseleave(function() {
    $(".services__image_two").removeClass("animated-image")
  });

  $(".solutions__wrapper_three").mouseenter(function() {
    $(".services__image_three").addClass("animated-image")
  });
  $(".solutions__wrapper_three").mouseleave(function() {
    $(".services__image_three").removeClass("animated-image")
  });

  $(".solutions__wrapper_four").mouseenter(function() {
    $(".services__image_four").addClass("animated-image")
  });
  $(".solutions__wrapper_four").mouseleave(function() {
    $(".services__image_four").removeClass("animated-image")
  });

  $('.top').click(function() {
  $('html, body').stop().animate({scrollTop: 0}, 'slow', 'swing');
  });

  $(window).scroll(function() {
  if ($(this).scrollTop() > $(window).height()) {
    $('.top').addClass("active");
  } else {
    $('.top').removeClass("active");
  };
  });

  var menu = $(".main-navigation");
  var menuLink = $(".main-nav__menu");
  var closeLink = $(".close-icon");

  menuLink.click(function () {
    menu.addClass("main-navigation_active");
  });

  closeLink.click(function () {
    menu.removeClass("main-navigation_active");
  });

  var mixer = mixitup('.tab-content');

  $('.tablink').click(function(e) {
    e.preventDefault()
  })
});
