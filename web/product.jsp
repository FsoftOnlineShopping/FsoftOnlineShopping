<%-- 
    Document   : product
    Created on : Jan 15, 2022, 9:54:39 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Product</title>
        <meta charset="UTF-8">  
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->

    </head>
    <body class="animsition">   

        <!-- Header -->
        <jsp:include page="header-v4-importer.jsp"></jsp:include>

            <!-- Cart -->
        <jsp:include page="your-cart-importer.jsp"></jsp:include>


            <!-- Product -->
            <div class="bg0 m-t-23 p-b-140">
                <div class="container">
                    <div class="flex-w flex-sb-m p-b-52">
                        <div class="flex-w flex-l-m filter-tope-group m-tb-10">


                            <button onclick="location.href = 'ProductControl';" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${empty categoryID ? "how-active1" : ""} " data-filter="*">
                            All Products
                        </button>

                        <c:forEach items="${listC}" var="e">

                            <button onclick="location.href = 'CategoryControl?categoryID=${e.categoryID}';" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${e.categoryID == categoryID ? "how-active1" : ""}" data-filter=".women">
                                ${e.categoryName}
                            </button>

                        </c:forEach>

                        <!--					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".men">
                                                                        Men
                                                                </button>
                        
                                                                <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".bag">
                                                                        Bag
                                                                </button>
                        
                                                                <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".shoes">
                                                                        Shoes
                                                                </button>
                        
                                                                <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".watches">
                                                                        Watches
                                                                </button>-->
                    </div>

                    <div class="flex-w flex-c-m m-tb-10">
                        <div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter ${categoryID != null ? "hide" : ""}">
                            <i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
                            <i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                            Filter
                        </div>

                        <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
                            <i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
                            <i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                            Search

                        </div>
                    </div>

                    <!-- Search product -->
                    <form action="SearchControl" method="post">
                        <div class="dis-none panel-search w-full p-t-10 p-b-15">
                            <div class="bor8 dis-flex p-l-15">
                                <input id="searchajax" oninput="searchAjax(this)" class="mtext-107 cl2 size-114 plh2 p-r-15" value="${txtS}" name="txt" type="text" placeholder="Search">
                                <button type="submit" class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
                                    <i class="zmdi zmdi-search"></i>
                                </button>


                            </div>	
                        </div>
                    </form>

                    <!-- Filter -->
                    <div class="dis-none panel-filter w-full p-t-10">
                        <div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
                            <div class="filter-col1 p-r-15 p-b-27">
                                <div class="mtext-102 cl2 p-b-15">
                                    Sort By
                                </div>

                                <ul>
                                    <!--								<li class="p-b-6">
                                                                                                            <a href="ProductControl" class="filter-link stext-106 trans-04 ${id == 1 ? "filter-link-active" : ""}">
                                                                                                                    Default
                                                                                                            </a>
                                                                                                    </li>-->

                                    <!--								<li class="p-b-6">
                                                                                                            <a href="#" class="filter-link stext-106 trans-04">
                                                                                                                    Popularity
                                                                                                            </a>
                                                                                                    </li>-->

                                    <li class="p-b-6">
                                        <a href="#" class="filter-link stext-106 trans-04 ${id == 2 ? "filter-link-active" : ""}">
                                            Average rating
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="SortControl?sort=NN" class="filter-link stext-106 trans-04 ${id == 4 ? "filter-link-active" : ""}">
                                            Newness
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="SortControl?sort=LH" class="filter-link stext-106 trans-04 ${id == 2 ? "filter-link-active" : ""}">
                                            Price: Low to High
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="SortControl?sort=HL" class="filter-link stext-106 trans-04 ${id == 3 ? "filter-link-active" : ""}">
                                            Price: High to Low
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="filter-col2 p-r-15 p-b-27">
                                <div class="mtext-102 cl2 p-b-15">
                                    Price
                                </div>

                                <ul>
                                    <!--								<li class="p-b-6">
                                                                                                            <a href="ProductControl" class="filter-link stext-106 trans-04 filter-link-active">
                                                                                                                    All
                                                                                                            </a>
                                                                                                    </li>-->

                                    <li class="p-b-6">
                                        <a href="SortControl?sort=P1" class="filter-link stext-106 trans-04 ${id == 5 ? "filter-link-active" : ""}">
                                            $0.00 - $10.00
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="SortControl?sort=P2" class="filter-link stext-106 trans-04 ${id == 6 ? "filter-link-active" : ""}">
                                            $10.00 - $25.00
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="SortControl?sort=P3" class="filter-link stext-106 trans-04 ${id == 7 ? "filter-link-active" : ""}">
                                            $25.00 - $40.00
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="SortControl?sort=P4" class="filter-link stext-106 trans-04 ${id == 8 ? "filter-link-active" : ""}">
                                            $40.00 - $50.00
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="SortControl?sort=P5" class="filter-link stext-106 trans-04 ${id == 9 ? "filter-link-active" : ""}">
                                            $50.00+
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="filter-col3 p-r-15 p-b-27" style="flex-grow: 2;">
                                <div class="mtext-102 cl2 p-b-15">
                                    Color
                                </div>

                                <ul style="display: flex; flex-wrap: wrap; justify-content: space-between;">
                                    <c:forEach items="${listCo}" var="e">
                                        <li class="p-b-6" style="width: 100px;">


                                            <a href="ColorControl?colorID=${e.colorID}" class="filter-link stext-106 trans-04 ${e.colorID == colorID ? "filter-link-active" : ""}">
                                                ${e.colorName}
                                            </a>
                                        </li>
                                    </c:forEach>

                                    <!--								<li class="p-b-6">
                                                                                                            <span class="fs-15 lh-12 m-r-6" style="color: #4272d7;">
                                                                                                                    <i class="zmdi zmdi-circle"></i>
                                                                                                            </span>
                                    
                                                                                                            <a href="#" class="filter-link stext-106 trans-04 filter-link-active">
                                                                                                                    Blue
                                                                                                            </a>
                                                                                                    </li>
                                    
                                                                                                    <li class="p-b-6">
                                                                                                            <span class="fs-15 lh-12 m-r-6" style="color: #b3b3b3;">
                                                                                                                    <i class="zmdi zmdi-circle"></i>
                                                                                                            </span>
                                    
                                                                                                            <a href="#" class="filter-link stext-106 trans-04">
                                                                                                                    Grey
                                                                                                            </a>
                                                                                                    </li>
                                    
                                                                                                    <li class="p-b-6">
                                                                                                            <span class="fs-15 lh-12 m-r-6" style="color: #00ad5f;">
                                                                                                                    <i class="zmdi zmdi-circle"></i>
                                                                                                            </span>
                                    
                                                                                                            <a href="#" class="filter-link stext-106 trans-04">
                                                                                                                    Green
                                                                                                            </a>
                                                                                                    </li>
                                    
                                                                                                    <li class="p-b-6">
                                                                                                            <span class="fs-15 lh-12 m-r-6" style="color: #fa4251;">
                                                                                                                    <i class="zmdi zmdi-circle"></i>
                                                                                                            </span>
                                    
                                                                                                            <a href="#" class="filter-link stext-106 trans-04">
                                                                                                                    Red
                                                                                                            </a>
                                                                                                    </li>
                                    
                                                                                                    <li class="p-b-6">
                                                                                                            <span class="fs-15 lh-12 m-r-6" style="color: #aaa;">
                                                                                                                    <i class="zmdi zmdi-circle-o"></i>
                                                                                                            </span>
                                    
                                                                                                            <a href="#" class="filter-link stext-106 trans-04">
                                                                                                                    White
                                                                                                            </a>
                                                                                                    </li>-->
                                </ul>
                            </div>

                            <!--						<div class="filter-col4 p-b-27">
                                                                                    <div class="mtext-102 cl2 p-b-15">
                                                                                            Tags
                                                                                    </div>
                            
                                                                                    <div class="flex-w p-t-4 m-r--5">
                                                                                            <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                                                                                                    Fashion
                                                                                            </a>
                            
                                                                                            <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                                                                                                    Lifestyle
                                                                                            </a>
                            
                                                                                            <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                                                                                                    Denim
                                                                                            </a>
                            
                                                                                            <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                                                                                                    Streetstyle
                                                                                            </a>
                            
                                                                                            <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                                                                                                    Crafts
                                                                                            </a>
                                                                                    </div>
                                                                            </div>-->
                        </div>
                    </div>
                </div>

                <div id="content-container" class="row isotope-grid">
                    <input type="hidden" id="sohang" value="${n}">
                    <c:forEach items="${listP}" var="o">
                        <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
                            <!-- Block2 -->

                            <div id="content" class="number block2">

                                <div class="block2-pic hov-img0">
                                    <img src="${o.imageFolder}/${o.productID} (1).jpg" alt="IMG-PRODUCT">

                                    <button onclick="quickView(${o.productID})"><a class=" block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
                                            Quick View
                                        </a></button>
                                </div>

                                <div class="block2-txt flex-w flex-t p-t-14">
                                    <div class="block2-txt-child1 flex-col-l ">
                                        <a href="DetailControl?productID=${o.productID}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                            ${o.productName}
                                        </a>

                                        <span class="stext-105 cl3">
                                            $${o.productPrice}
                                        </span>
                                    </div>
                                    <div class="block2-txt-child2 flex-r p-t-3">
                                        <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                                            <img class="icon-heart1 dis-block trans-04" src="images/icons/icon-heart-01.png" alt="ICON">
                                            <img class="icon-heart2 dis-block trans-04 ab-t-l" src="images/icons/icon-heart-02.png" alt="ICON">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>     

                </div>

                <!-- Load more -->
                <c:if test="${isShow == null}">
                    <div class="flex-c-m flex-w w-full p-t-45">
                        <button onclick="loadMore()" id="loadmore" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
                            Load More

                        </button>   
                    </div>
                </c:if>
            </div>
        </div>


        <!-- Footer -->
        <jsp:include page="footer-importer.jsp"></jsp:include>


            <!-- Back to top -->
            <div class="btn-back-to-top" id="myBtn">
                <span class="symbol-btn-back-to-top">
                    <i class="zmdi zmdi-chevron-up"></i>
                </span>
            </div>

            <!-- Modal1 -->
            <div class=" wrap-modal1 js-modal1 p-t-60 p-b-20">
                <div class="overlay-modal1 js-hide-modal1"></div>

                <div id="quick-view" class="container">
                <jsp:include page="quick-view-modal-importer.jsp"></jsp:include>
            </div>
        </div>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!--===============================================================================================-->      
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                            function loadMore() {
                                var amount = document.getElementsByClassName("number").length;
                                $.ajax({
                                    url: "/FsoftOnlineShopping/loadMoreControl",
                                    type: "get", //send it through get method
                                    data: {
                                        amount: amount
                                    },
                                    success: function (data) {
                                        console.log('success');
                                        var row = document.getElementById("content-container");
                                        row.innerHTML += data;
                                    },
                                    error: function (xhr) {
                                        //Do Something to handle error
                                    }
                                });

                                if ((amount + 8) >= Number(document.getElementById("sohang").value))
                                    document.getElementById("loadmore").style.display = 'none';

                            }

        </script>

        <script>
            function searchAjax(param) {
                var txtSearch = param.value;
                $.ajax({
                    url: "/FsoftOnlineShopping/SearchAjaxControl",
                    type: "get", //send it through get method
                    data: {
                        txt: txtSearch
                    },
                    success: function (data) {
                        var row = document.getElementById("content-container");
                        row.innerHTML = data;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                })
                document.getElementById("loadmore").style.display = 'none';
            }
        </script>

        <script src="js/quickview.js"></script>
        <!--===============================================================================================-->	
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>

        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <script>
            $(".js-select2").each(function () {
                $(this).select2({
                    minimumResultsForSearch: 20,
                    dropdownParent: $(this).next('.dropDownSelect2')
                });
            })
        </script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/slick/slick.min.js"></script>
        <script src="js/slick-custom.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/parallax100/parallax100.js"></script>
        <script>
            $('.parallax100').parallax100();
        </script>
        <!--===============================================================================================-->
        <script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
        <script>
            $('.gallery-lb').each(function () { // the containers for all your galleries
                $(this).magnificPopup({
                    delegate: 'a', // the selector for gallery item
                    type: 'image',
                    gallery: {
                        enabled: true
                    },
                    mainClass: 'mfp-fade'
                });
            });
        </script>
        <!--===============================================================================================-->
        <script src="vendor/isotope/isotope.pkgd.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/sweetalert/sweetalert.min.js"></script>
        <script>
            $('.js-addwish-b2, .js-addwish-detail').on('click', function (e) {
                e.preventDefault();
            });
            $('.js-addwish-b2').each(function () {
                var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
                $(this).on('click', function () {
                    swal(nameProduct, "is added to wishlist !", "success");
                    $(this).addClass('js-addedwish-b2');
                    $(this).off('click');
                });
            });
            $('.js-addwish-detail').each(function () {
                var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();
                $(this).on('click', function () {
                    swal(nameProduct, "is added to wishlist !", "success");
                    $(this).addClass('js-addedwish-detail');
                    $(this).off('click');
                });
            });
            /*---------------------------------------------*/
            $('.js-addcart-detail').each(function () {
                var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
                $(this).on('click', function () {
                    swal(nameProduct, "is added to cart !", "success");
                });
            });

        </script>
        <!--===============================================================================================-->
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script>
            $('.js-pscroll').each(function () {
                $(this).css('position', 'relative');
                $(this).css('overflow', 'hidden');
                var ps = new PerfectScrollbar(this, {
                    wheelSpeed: 1,
                    scrollingThreshold: 1000,
                    wheelPropagation: false,
                });
                $(window).on('resize', function () {
                    ps.update();
                })
            });
        </script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

    </body>
</html>