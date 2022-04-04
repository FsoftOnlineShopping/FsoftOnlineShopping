<%-- 
    Document   : quick-view-modal-importer
    Created on : Jan 18, 2022, 4:17:34 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="quickview bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
    <button class="how-pos3 hov3 trans-04 js-hide-modal1">
        <img src="images/icons/icon-close.png" alt="CLOSE">
    </button>

    <div class="row">
        <div class="col-md-6 col-lg-7 p-b-30">
            <div class="p-l-25 p-r-30 p-lr-0-lg">
                <div class="wrap-slick3 flex-sb flex-w">
                    <!--something here-->
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-5 p-b-30">
            <div class="p-r-50 p-t-5 p-lr-0-lg">
                <h4 id="product-name" class="mtext-105 cl2 js-name-detail p-b-14">
                </h4>

                <span id="product-price" class="mtext-106 cl2">
                </span>

                <p id="product-description" class="stext-102 cl3 p-t-23">
                </p>

                <!--  -->
                <div class="p-t-33">
                    <div class="flex-w flex-r-m p-b-10">
                        <div class="size-203 flex-c-m respon6">
                            Size
                        </div>

                        <div class="size-204 respon6-next">
                            <div class="rs1-select2 bor8 bg0">
                                <select class="js-select2" name="time">
                                    <option>Choose an option</option>
                                    <option>Size S</option>
                                    <option>Size M</option>
                                    <option>Size L</option>
                                    <option>Size XL</option>
                                    <option>Size 2XL</option>
                                    <option>Size 3XL</option>
                                   
                                </select>
                                <div class="dropDownSelect2"></div>
                            </div>
                        </div>
                    </div>

                    <div class="flex-w flex-r-m p-b-10">
                        <div class="size-203 flex-c-m respon6">
                            Color
                        </div>

                        <div class="size-204 respon6-next">
                            <div class="rs1-select2 bor8 bg0">
                                <select class="js-select2" name="time">
                                    <option>Choose an option</option>
                                    <c:forEach items="${listCo}" var="o">
                                    <option>${o.colorName}</option>
                                    </c:forEach>
<!--                                    <option>Blue</option>
                                    <option>White</option>
                                    <option>Grey</option>-->
                                </select>
                                <div class="dropDownSelect2"></div>
                            </div>
                        </div>
                    </div>

                    <div class="flex-w flex-r-m p-b-10">
                        <div class="size-204 flex-w flex-m respon6-next">
                            <div class="wrap-num-product flex-w m-r-20 m-tb-10">
                                <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                    <i class="fs-16 zmdi zmdi-minus"></i>
                                </div>

                                <input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="1">

                                <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                    <i class="fs-16 zmdi zmdi-plus"></i>
                                </div>
                            </div>

                            <button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
                                Add to cart
                            </button>
                        </div>
                    </div>	
                </div>

                <!--  -->
                <div class="flex-w flex-m p-l-100 p-t-40 respon7">
                    <div class="flex-m bor9 p-r-10 m-r-11">
                        <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
                            <i class="zmdi zmdi-favorite"></i>
                        </a>
                    </div>

                    <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
                        <i class="fa fa-facebook"></i>
                    </a>

                    <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
                        <i class="fa fa-twitter"></i>
                    </a>

                    <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
                        <i class="fa fa-google-plus"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
