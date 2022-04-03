<%-- 
    Document   : admin-dashboard
    Created on : Mar 16, 2022, 8:28:37 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- Style Dashboard css -->
        <link rel="stylesheet" href="css/admin-dashboard.css">
        <!-- Style Admin General css -->
        <link rel="stylesheet" href="css/admin-general.css">
        <title>Document</title>
    </head>

    <body>
        <div class="container">
            <!--header-aside-->
            <jsp:include page="admin-header-aside-importer.jsp"></jsp:include>
                <!-- Right Side/ Content -->
                <div class="main">
                <jsp:include page="admin-header-importer.jsp"></jsp:include>
                <div class="dashboard">
                    <nav class="breadcrumb">
                        <ol class="breadcrumb-list d-flex">
                            <li class="breadcrumb-items breadcrumb-prev"><a href="">Home</a></li>
                            <span><i class="far fa-chevron-right"></i></span>
                            <li class="breadcrumb-items breadcrumb-current"><a href="">Dashboard</a></li>
                        </ol>
                    </nav>
                    <div class="dashboard-title">
                        Dashboard Quick View
                    </div>
                    <div class="quick-status">
                        <div class="row">
                            <div class="col l-6 ">
                                <div class="row">
                                    <div class="col l-6 m-6 c-12">
                                        <div class="status-card align-items-center d-flex">
                                            <div class="icon"><i class='bx bx-user-plus'></i></div>
                                            <div class="body">
                                                <div class="number">+1,995</div>
                                                <div class="content">New Users</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col l-6 m-6 c-12">
                                        <div class="status-card align-items-center d-flex">
                                            <div class="icon"><i class='bx bx-cart'></i></div>
                                            <div class="body">
                                                <div class="number">+2,064</div>
                                                <div class="content">New Orders</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col l-6 m-6 c-12">
                                        <div class="status-card align-items-center d-flex">
                                            <div class="icon"><i class='bx bx-sitemap'></i></div>
                                            <div class="body">
                                                <div class="number">+3,164</div>
                                                <div class="content">New Traffics</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col l-6 m-6 c-12">
                                        <div class="status-card align-items-center d-flex">
                                            <div class="icon"><i class='bx bx-coin-stack'></i></div>
                                            <div class="body">
                                                <div class="number">$5,180</div>
                                                <div class="content">Total Income</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col l-6 c-12">
                                <div class="income-analysis">
                                    <canvas id="income-analysis"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <section class="dashboard-main">
                        <div class="row">
                            <div class="col l-5 c-12">
                                <div class="top-customers">
                                    <div class="title">Top Customers</div>
                                    <table class="table table-top-customers">
<!--                                        <tr>
                                            <th>User</th>
                                            <th>Total Orders</th>
                                            <th>Total Spending</th>
                                        </tr>
                                        <tr>
                                            <td>Luong Nguyen Nhat Quang</td>
                                            <td>496</td>
                                            <td>$20,894</td>
                                        </tr>
                                        <tr>
                                            <td>Manh Khoi</td>
                                            <td>23</td>
                                            <td>$10,894</td>
                                        </tr>
                                        <tr>
                                            <td>Huynh Ngo Trieu Phuc</td>
                                            <td>1564</td>
                                            <td>$110,894</td>
                                        </tr>
                                        <tr>
                                            <td>Minh</td>
                                            <td>6</td>
                                            <td>$986</td>
                                        </tr>
                                        <tr>
                                            <td>Nguyen Thu Nhi</td>
                                            <td>630</td>
                                            <td>$145,891</td>
                                        </tr>-->
                                    </table>
                                    <div class="view-all"><a href="#">View All</a></div>
                                </div>
                            </div>
                            <div class="col l-7 c-12">
                                <div class="latest-orders">
                                    <div class="title">Latest Orders</div>
                                    <table class="table table-latest-order">
<!--                                        <tr>
                                            <th>Order ID</th>
                                            <th>User</th>
                                            <th>Total Price</th>
                                            <th>Date</th>
                                            <th>Status</th>
                                        </tr>
                                        <tr>
                                            <td>#125</td>
                                            <td>Luong Nguyen Nhat Quang</td>
                                            <td>$20,894</td>
                                            <td>17 Jun 2022</td>
                                            <td><span class="status paid">Paid</span></td>
                                        </tr>
                                        <tr>
                                            <td>#124</td>
                                            <td>Manh Khoi</td>
                                            <td>$10,894</td>
                                            <td>23 May 2014</td>
                                            <td><span class="status pending">Pending</span></td>
                                        </tr>
                                        <tr>
                                            <td>#123</td>
                                            <td>Huynh Ngo Trieu Phuc</td>
                                            <td>$110,894</td>
                                            <td>23 May 2014</td>
                                            <td><span class="status shipping">Shipping</span></td>
                                        </tr>
                                        <tr>
                                            <td>#122</td>
                                            <td>Minh</td>
                                            <td>$986</td>
                                            <td>23 Oct 2023</td>
                                            <td><span class="status refund">Refund</span></td>
                                        </tr>
                                        <tr>
                                            <td>#121</td>
                                            <td>Nguyen Thu Nhi</td>
                                            <td>$145,891</td>
                                            <td>24 Dec 2014</td>
                                            <td><span class="status shipping">Shipping</span></td>
                                        </tr>-->
                                    </table>
                                    <div class="view-all"><a href="#">View All</a></div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>


        <!-- font awsomwe pro-->
        <script src="font-awesome-pro-master/js/pro.min.js"></script>
        <script>
//            Define active nav
            var nav__itemLists = document.querySelectorAll(".nav__item");
            nav__itemLists[0].classList.add("real-active", "active");
        </script>
        <script type="text/javascript" src="js/admin-general.js"></script>
        <!-- Chart JS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            
        </script>
        <script src="js/handle-render-admin-dashboard.js"></script>
    </body>

</html>
