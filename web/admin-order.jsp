<%-- 
    Document   : admin-order
    Created on : Mar 16, 2022, 8:32:16 AM
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

        <!-- Order css -->
        <link rel="stylesheet" href="css/admin-order.css"> 
        <!-- Style Admin General css -->
        <link rel="stylesheet" href="css/admin-general.css">
        <title>Orders</title>
    </head>

    <body>
        <div class="container">
            <!--header-aside-->
            <jsp:include page="admin-header-aside-importer.jsp"></jsp:include>
            <!-- Right Side/ Content -->
            <div class="main">
                <div class="top-bar d-flex justify-content-between">
                    <div class="top-bar__left d-flex align-items-center">
                        <div class="toggle d-flex align-items-center">
                            <div class="toggle-menu d-flex align-items-center"><i class='bx bx-menu'></i></div>
                        </div>
                        <div class="change-theme d-flex align-items-center">
                            <div class="theme-sun d-none d-flex align-items-center"><i class='bx bx-sun'></i></div>
                            <div class="theme-moon  d-flex align-items-center"><i class='bx bx-moon'></i></div>
                        </div>
                    </div>
                    <div class="top-bar__right d-flex align-items-center justify-content-end">
                        <div class="notification d-flex align-items-center"><i class='bx bx-bell'></i></div>
                        <div class="user d-flex  align-items-center">
                            <div class="user-image"><img src="images/avatar/quang.jpg" alt="Quang"></div>
                            <div class="user-content">
                                <div class="user-welcome">Welcome</div>
                                <div class="user-name">Luong Nguyen Nhat Quang</div>
                            </div>
                        </div>
                    </div>
                </div>
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
                                                <div class="number">1,995</div>
                                                <div class="content">New Orders</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col l-3 m-6 c-12">
                                        <div class="order-card border-orange align-items-center d-flex">
                                            <div class="icon"><i class='bx bxs-discount'></i></div>
                                            <div class="body">
                                                <div class="number">-$2,064</div>
                                                <div class="content">Discount</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col l-3 m-6 c-12">
                                        <div class="order-card border-red align-items-center d-flex">
                                            <div class="icon"><i class='bx bx-barcode-reader'></i></div>
                                            <div class="body">
                                                <div class="number">3,164</div>
                                                <div class="content">Use Coupons</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col l-3 m-6 c-12">
                                        <div class="order-card border-blue align-items-center d-flex">
                                            <div class="icon"><i class='bx bx-coin-stack'></i></div>
                                            <div class="body">
                                                <div class="number">$5,180</div>
                                                <div class="content">Total Orders</div>
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
                                        <input type="text" name="search" placeholder="Search...">
                                    </div>
                                    <div class="sort-by d-flex align-items-center">
                                        <label for="form-orders" class="d-flex align-items-center"><i class='bx bx-sort'></i><span>Sort by:</span></label>
                                        <select name="form-orders"  id="form-orders" class="form-select">
                                            <option value="default" selected="">Default</option>
                                            <option value="AtoZ">Full Name: A to Z</option>
                                            <option value="ZtoA">Full Name: Z to A</option>
                                            <option value="orderDateNewest">Order date: Newest</option>
                                            <option value="orderDateOldest">Order date: Oldest</option>
                                            <option value="orderPayDateNewest">Order Pay date: Newest</option>
                                            <option value="orderPayDateOldest">Order Pay date: Oldest</option>
                                            <option value="billTotalLargeToSmall">Bill Total: Large to small</option>
                                            <option value="billTotalSmallToLarge">Bill Total: Small to large</option>
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
                                    <tr>
                                        <th>ID</th>
                                        <th>User</th>
                                        <th>Payment Date</th>
                                        <th>Deliver Date</th>  
                                        <th>Coupon</th>
                                        <th>Payment Method</th>
                                        <th>Discount</th>
                                        <th>Bill Total</th>
                                        <th>Status</th>
                                    </tr>
                                    <tr>
                                        <td>#199</td>
                                        <td>Luong Nguyen Nhat Quang</td>
                                        <td>12 Jun 2022</td>
                                        <td>15 Jun 2022</td>
                                        <td>ST20K</td>
                                        <td>Momo</td>
                                        <td>-$2,894</td>
                                        <td>$32,894</td>
                                        <td><span class="status paid">Paid</span></td>
                                    </tr>
                                    <tr>
                                        <td>#200</td>
                                        <td>Manh Khoi</td>
                                        <td>23 May 2022</td>
                                        <td>27 May 2022</td>
                                        <td>GD40K</td>
                                        <td>NH Vietcombank</td>
                                        <td>-$1,824</td>
                                        <td>$10,894</td>
                                        <td><span class="status shipping">Shipping</span></td>
                                    </tr>
                                    <tr>
                                        <td>#201</td>
                                        <td>Huynh Ngo Trieu Phuc</td>
                                        <td>23 Jan 2021</td>
                                        <td>2 Feb 2021</td>
                                        <td></td>
                                        <td>Tien Mat</td>
                                        <td>-$0</td>
                                        <td>$110,894</td>
                                        <td><span class="status pending">Pending</span></td>
                                    </tr>
                                    <tr>
                                        <td>#202</td>
                                        <td>Minh</td>
                                        <td>23 Oct 2021</td>
                                        <td>2 Sep 2021</td>
                                        <td></td>
                                        <td>Tien Mat</td>
                                        <td>-$0</td>
                                        <td>$986</td>
                                        <td><span class="status refund">Refund</span></td>
                                    </tr>
                                    <tr>
                                        <td>#203</td>
                                        <td>Nguyen Thu Nhi</td>
                                        <td>14 Oct 2021</td>
                                        <td>2 Sep 2021</td>
                                        <td>NM200K</td>
                                        <td>Visa Card</td>
                                        <td>-$450</td>
                                        <td>$145,891</td>
                                        <td><span class="status paid">Paid</span></td>
                                    </tr>
                                </table>
                                <div class="view-all"><a href="#">Load More</a></div>
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
    </body>

</html>
