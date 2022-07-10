var testGallery = [
    {href: 'content/1.jpg'},
    {href: 'content/2.jpg'},
    {href: 'content/3.jpg'},
    {href: 'content/4.jpg'},
    {href: 'content/5.jpg'},
    {href: 'content/6.jpg'},
    {href: 'content/7.jpg'},
];


function init() {
    $('.js_slider').slick({
        infinite: true,
        speed: 500,
        fade: true,
        autoplay: true,
        autoplaySpeed: 10000,
        arrows: false
    });

    $('.js__reviews').slick({
        infinite: true,
        speed: 500
    });

    $('.fancybox').fancybox();

    var map;

    DG.then(function () {
        map = DG.map('map', {
            center: [55.0296808, 82.9186143],
            zoom: 16
        });

        DG.marker([55.0296808, 82.9186143]).addTo(map);
    });


    $(".page__menu").stickymenu({
        "stickyBarSelector": ".page__menu",
        "menuItemSelector": "li"
    });

    $(window).on('scroll load', function () {
        var top = $(window).scrollTop(),
            h = $(window).height();

        if ((top + h - 100) >= h){
            $('.to__top').addClass('visible');
        } else {
            $('.to__top').removeClass('visible');
        }
    });

    $('.to__top').on('click', function(ev){
        ev.preventDefault();

        $('html, body').animate({scrollTop: 0}, 1000);
    })

    phoneMask($('.phone-mask'));

}

function showGallery(event) {
    var id = $(this).data('id');

    $.fancybox(testGallery, {
        helpers: {
            thumbs: {
                width: 130,
                height: 88
            }
        }
    });

    return event.preventDefault();
}

$(document)
    .ready(init)
    .on('submit', '.js_form_popup', submitFormModal)
    .on('submit', '.js_form', submitForm)
    .on('click', '.js_view_gallery', showGallery)
    .on('click', '.form__control', refreshError);
