<%-- 
    Document   : admin-order
    Created on : Mar 16, 2022, 8:32:16 AM
    Author     : ADMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Cart"%>
<%@page import="DAO.Cart.CartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Base css -->
        <link rel="stylesheet" href="css/base.css">
        <!-- font awsomwe pro-->
        <link rel="stylesheet" href="font-awesome-pro-master/css/all.min.css">
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>

        <!-- Order css -->
        <link rel="stylesheet" href="css/admin-order.css"> 
        <!-- Style Admin General css -->
        <link rel="stylesheet" href="css/admin-general.css">
        <title>Orders</title>
        <%
            CartDAO cdao = new CartDAO();
            ArrayList<Cart> list = cdao.getListCart();
        %>
    </head>

    <body>
        <div class="container">
            <!--header-aside-->
            <jsp:include page="admin-header-aside-importer.jsp"></jsp:include>
                <!-- Right Side/ Content -->
                <div class="main">
                <jsp:include page="admin-header-importer.jsp"></jsp:include>
                <div class="orders">
                    <nav class="breadcrumb">
                        <ol class="breadcrumb-list d-flex">
                            <li class="breadcrumb-items breadcrumb-prev"><a href="">Home</a></li>
                            <span><i class="far fa-chevron-right"></i></span>
                            <li class="breadcrumb-items breadcrumb-current"><a href="">Orders</a></li>
                        </ol>
                    </nav>
                    <div class="orders-title">
                        Orders Management
                    </div>
                    <div class="orders-status">
                        <div class="row">
                            <div class="col c-12">
                                <div class="row">
                                    <div class="col l-3 m-6 c-12">
                                        <div class="order-card border-green align-items-center d-flex">
                                            <div class="icon"><i class='bx bx-cart'></i></div>
                                            <div class="body">
                                                <div class="number">${newOrders}</div>
                                                <div class="content">New Orders</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col l-3 m-6 c-12">
                                        <div class="order-card border-orange align-items-center d-flex">
                                            <div class="icon"><i class='bx bxs-discount'></i></div>
                                            <div class="body">
                                                <div class="number">-$0</div>
                                                <div class="content">Discount</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col l-3 m-6 c-12">
                                        <div class="order-card border-red align-items-center d-flex">
                                            <div class="icon"><i class='bx bx-barcode-reader'></i></div>
                                            <div class="body">
                                                <div class="number">${totalOrder}</div>
                                                <div class="content">Total Orders</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col l-3 m-6 c-12">
                                        <div class="order-card border-blue align-items-center d-flex">
                                            <div class="icon"><i class='bx bx-coin-stack'></i></div>
                                            <div class="body">
                                                <div class="number">$${totalIncome}</div>
                                                <div class="content">Total Income</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col c-12">
                                <div class="row">
                                    <div class="col l-7 m-7 c-12">
                                        <div class="orders-analysis">
                                            <div class="card-header">
                                                <div class="card-title">Revenue Breakdown</div>
                                                <div class="card-sub-title">Compared to last year</div>
                                            </div>
                                            <div class="card-body">
                                                <div class="card-body-over">
                                                    <div class="row">
                                                        <div class="col l-2 c-12"
                                                             style="display: flex; justify-content: space-evenly; flex-direction:column">
                                                            <!-- <div class="actual-target-goal-cover"> -->
                                                            <div class="actual-target-goal">
                                                                <div class="title">Actual Revenue</div>
                                                                <div class="number">$54,289</div>
                                                            </div>
                                                            <div class="actual-target-goal">
                                                                <div class="title">Target Revenue</div>
                                                                <div class="number">$50,000</div>
                                                            </div>
                                                            <div class="actual-target-goal positive">
                                                                <div class="title">Goal</div>
                                                                <div class="number">119%</div>
                                                            </div>
                                                            <!-- </div> -->
                                                        </div>
                                                        <div class="col l-10 c-12">
                                                            <div class="canvas-h-80">
                                                                <canvas id="orders-analysis"></canvas>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col l-5 m-5 c-12">
                                        <div class="orders-status-analysis">
                                            <div class="card-header">
                                                <div class="card-title">Orders Status</div>
                                                <div class="card-sub-title">Aspect Ratio</div>
                                            </div>
                                            <div class="card-body">
                                                <div class="canvas-w-80">
                                                    <canvas id="orders-status-analysis"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <section class="orders-main">
                        <div class="orders-overview">
                            <div class="overview-header">
                                <div class="overview-title">Orders Breakdown</div>
                                <div class="overview-sub-title">Details and history</div>
                            </div>
                            <div class="overview-body">
                                <div class="overview-function d-flex align-items-center">
                                    <div class="search">
                                        <input oninput="searchAjax(this)" value="${txtS}" name="txt" type="text" placeholder="Search...">
                                    </div>
                                    <div class="sort-by d-flex align-items-center">
                                        <label for="form-orders" class="d-flex align-items-center"><i class='bx bx-sort'></i><span>Sort by:</span></label>                                  
                                        <select name="form-orders"  id="form-orders" class="form-select" onchange="window.location=this.value">
                                            <option value="" disabled selected>Select your option</option>
                                            <option value="CartManagerControl">Default</option>
                                            <option value="CartSortingControl?sortID=AToZ">Full Name: A to Z</option>
                                            <option value="CartSortingControl?sortID=ZtoA">Full Name: Z to A</option>
                                            <option value="CartSortingControl?sortID=orderDateNewest">Order date: Newest</option>
                                            <option value="CartSortingControl?sortID=orderDateOldest">Order date: Oldest</option>
                                            <option value="CartSortingControl?sortID=billTotalLargeToSmall">Bill Total: Large to small</option>
                                            <option value="CartSortingControl?sortID=billTotalSmallToLarge">Bill Total: Small to large</option>
                                        </select>
                                    </div>
                                    <div class="filter d-flex align-items-center">
                                        <label for="form-orders" class="d-flex align-items-center"><i class='bx bx-filter-alt'></i></span>Filter by:</label>
                                        <select name="form-orders"  id="form-orders" class="form-select">
                                            <option value="notDone">State: Not Done</option>
                                            <option value="isDone">State: Is Done</option>
                                        </select>
                                    </div>
                                    <div class="export"><a class="primary-btn" href="#"><button class="primary-btn" type="button" name="export">Export To Excel</button></a></div>
                                </div>
                                <table class="table table-orders-overview">
                                    <tbody id="order-tag">
                                        <input type="hidden" id="numOfOrder" value="${totalOrder}">
                                        <c:forEach items="${listC}" var="o">
                                            <tr>
                                                <th>ID</th>
                                                <th>Username</th>
                                                <th>Payment Date</th>
                                                <th>Deliver Date</th>  
                                                <th>Coupon</th>
                                                <th>Payment Method</th>
                                                <th>Discount</th>
                                                <th>Bill Total</th>
                                                <th>Status</th>
                                            </tr>
                                            <tr>
                                                <td>#${o.cartID}</td>
                                                <td>${o.userName}</td>
                                                <td>${o.paymentDate}</td>
                                                <td>${o.deliverDate}</td>
                                                <td>${o.couponID}</td>
                                                <td>
                                                    <c:set var="payment" value="${o.paymentMethodID}"></c:set>
                                                    <c:choose>
                                                        <c:when test = "${payment == 1}">
                                                            Momo
                                                        </c:when>
                                                        <c:when test = "${payment == 2}">
                                                            Credit Card
                                                        </c:when>
                                                        <c:when test = "${payment == 3}">
                                                            Bank
                                                        </c:when>
                                                        <c:when test = "${payment == 4}">
                                                            COD
                                                        </c:when>  
                                                        <c:otherwise>
                                                            Not paid
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>-$0</td>
                                                <td>$${o.totalPrice}</td>
                                                <td><span class="status paid">Paid</span></td>
                                            </tr>                                    
                                        </c:forEach>
                                    </tbody>
                                </table>
                                    <!-- Load more -->
                                    <c:if test="${isShow == null}">
                                        <div onclick="loadMore()" id="loadmore" role="button" class="view-all">Load More</a></div>
                                    </c:if>                              
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!-- font awsomwe pro-->
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="font-awesome-pro-master/js/pro.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://phpcoder.tech/multiselect/js/jquery.multiselect.js"></script>
        
        <script>
//            Define active nav
            var nav__itemLists = document.querySelectorAll(".nav__item");
            nav__itemLists[1].classList.add("real-active", "active");
        </script>
        <script type="text/javascript" src="js/admin-general.js"></script>
        <!-- Chart JS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            const labels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
            const data = {
                labels: labels,
                datasets: [{
                        type: 'bar',
                        label: 'Orders last year',
                        backgroundColor: '#28a428',
                        cubicInterpolationMode: 'monotone',
                        borderDash: [20, 5],
                        borderColor: '#28a428',
                        data: [0, 10, 5, 15, 30, 24, 26, 34, 42, 26, 15, 15, 30],
                    }, {
                        type: 'bar',
                        label: 'Orders this year',
                        backgroundColor: '#fd5631',
                        borderColor: '#fd5631',
                        cubicInterpolationMode: 'monotone',
                        data: [6, 23, 14, 6, 26, 12, 45, 23, 34, 56, 45, 26, 12]
                    }]
            };
            const config = {
                type: 'bar',
                data: data,
                options: {
                    scales: {
                        x: {
                            grid: {
                                display: false
                            }
                        },
                        y: {
                            grid: {
                                display: false
                            },
                            beginAtZero: true
                        }
                    },
                    plugins: {
                        legend: {
                            labels: {
                                boxWidth: 10,
                                boxHeight: 10,
                                usePointStyle: true,
                                pointStyle: 'circle',
                            },
                        }
                    },

                }
            };
            const myChart = new Chart(
                    document.getElementById('orders-analysis'),
                    config
                    );
        </script>

        <script>
            var body_color = getComputedStyle(document.documentElement)
                    .getPropertyValue('--body-color');
            const labels_pie = ['Paid', 'Shipping', 'Pending', 'Refund'];
            const data_pie = {
                labels: labels_pie,
                datasets: [{
                        type: 'pie',
                        label: 'Orders last year',
                        backgroundColor: ['#28a428', '#3862e0', '#ff674d', '#ff1a1a'],
                        cubicInterpolationMode: 'monotone',
                        borderDash: [20, 5],
                        // borderColor: ['#28a428', '#3862e0', '#ff674d', '#ff1a1a'],
                        borderColor: [body_color, body_color, body_color, body_color],
                        data: [50, 10, 2, 15],
                        hoverOffset: 4,
                    }]
            };
            const config_pie = {
                type: 'pie',
                data: data_pie,
                options: {
                    scales: {
                        x: {
                            grid: {
                                display: false
                            },
                            display: false
                        },
                        y: {
                            grid: {
                                display: false
                            },
                            beginAtZero: true,
                            display: false
                        }
                    },
                    plugins: {
                        legend: {
                            labels: {
                                boxWidth: 10,
                                boxHeight: 10,
                                usePointStyle: true,
                                pointStyle: 'circle',
                            },
                        }
                    },

                }
            };
            pieChart = new Chart(
                    document.getElementById('orders-status-analysis'),
                    config_pie
                    );
        </script>
        <script>
            function searchAjax(param) {
                var txtSearch = param.value;
                $.ajax({
                    url: "/FsoftOnlineShopping/SearchOrderAdmin",
                    type: "get", //send it through get method
                    data: {
                        txt: txtSearch
                    },
                    success: function (data) {
                        var row = document.getElementById("order-tag");
                        row.innerHTML = data;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                })
            }
        </script>
        
        <script>
        function loadMore() {         
            var table = document.getElementsByClassName('table table-orders-overview')[0];
            var amount = table.rows.length/2;
            $.ajax({
                url: "/FsoftOnlineShopping/LoadMoreAdminOrder",
                type: "get", //send it through get method
                data: {
                    amount: amount
                },
                success: function (data) {
                    console.log('success');
                    var row = document.getElementById("order-tag");
                    row.innerHTML += data;
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
            if ((amount + 10) >= Number(document.getElementById("numOfOrder").value))
                document.getElementById("loadmore").style.display = 'none';
        }
        </script>
    </body>
</html>
