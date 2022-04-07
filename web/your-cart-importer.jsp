<%-- 
    Document   : your-cart-importer
    Created on : Jan 18, 2022, 3:51:57 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Cart
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			
                    <c:set var="o" value="${sessionScope.cart}"/>
                    <c:set var="total" value="${0}"/>
			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
                                        <c:forEach items="${o.items}" var="i">
					<li class="header-cart-item flex-w flex-t m-b-12">
                                                <a href="deletecart?productID=${i.product.productID}">
                                                    <div class="header-cart-item-img">
							<img src="${i.product.imageFolder}/${i.product.productID} (1).jpg" alt="IMG">
                                                    </div>
                                                </a>       
						<div class="header-cart-item-txt p-t-8">
							<a href="product-detail.jsp?productID=${i.product.productID}" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								${i.product.productName}
							</a>
							<span class="header-cart-item-info">
								${i.quantity} x $${i.price}
							</span>
						</div>
					</li>
                                        <c:set var="total" value="${total + i.quantity * i.price}" />
                                        </c:forEach>
				</ul>	
				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">
                                            Total: $<c:out value="${total}"></c:out>
					</div>
					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart.jsp" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							View Cart
						</a>
						<a href="shoping-cart.jsp" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Check Out
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>