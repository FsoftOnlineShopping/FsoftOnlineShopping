/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function quickView(pid) {
    var id = pid;
    $.ajax({
        url: "/FsoftOnlineShopping/QuickViewControl",
        type: "get", //send it through get method
        data: {
            pid: id
        },
        success: function (data) {
            console.log(data);
            product = data.product;
            images = data.images;

            _name = $("#product-name");
            _price = $("#product-price");
            _description = $("#product-description");

            _name.html(product.productName);
            _price.html(product.productPrice);
            _description.html(product.productDescription);
            
            $(".wrap-slick3").empty();
            $(".wrap-slick3").append(
                '<div class="wrap-slick3-dots"></div>' +
                '<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>' +
                '<div class="slick3 gallery-lb"></div>'
            );
            _gallery = $(".wrap-slick3 .slick3").first();
            
            console.log(_gallery);
            
            images.forEach(imageUrl => _gallery.append(`
                <div class="item-slick3" data-thumb="${imageUrl}">
                        <div class="wrap-pic-w pos-relative">
                                <img src="${imageUrl}" alt="IMG-PRODUCT">

                                <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${imageUrl}">
                                        <i class="fa fa-expand"></i>
                                </a>
                        </div>
                </div>
            `));

            $('.wrap-slick3').each(function(){
                $(this).find('.slick3').slick({
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    fade: true,
                    infinite: true,
                    autoplay: false,
                    autoplaySpeed: 6000,

                    arrows: true,
                    appendArrows: $(this).find('.wrap-slick3-arrows'),
                    prevArrow:'<button class="arrow-slick3 prev-slick3"><i class="fa fa-angle-left" aria-hidden="true"></i></button>',
                    nextArrow:'<button class="arrow-slick3 next-slick3"><i class="fa fa-angle-right" aria-hidden="true"></i></button>',

                    dots: true,
                    appendDots: $(this).find('.wrap-slick3-dots'),
                    dotsClass:'slick3-dots',
                    customPaging: function(slick, index) {
                        var portrait = $(slick.$slides[index]).data('thumb');
                        return '<img src=" ' + portrait + ' "/><div class="slick3-dot-overlay"></div>';
                    },  
                });
            });
            showModal();
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    })
}
