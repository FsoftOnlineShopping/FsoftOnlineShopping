<%-- 
    Document   : admin-account
    Created on : Mar 27, 2022, 11:57:57 PM
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
        <link rel="stylesheet" href="css/admin-account.css">
        <!-- Style Admin General css -->
        <link rel="stylesheet" href="css/admin-general.css">
        <title>Accounts</title>
    </head>

    <body>
        <div class="container">
            <!--header-aside-->
            <jsp:include page="admin-header-aside-importer.jsp"></jsp:include>
                <div class="main">
                <jsp:include page="admin-header-importer.jsp"></jsp:include>
                <div class="accounts">
                    <nav class="breadcrumb">
                        <ol class="breadcrumb-list d-flex">
                            <li class="breadcrumb-items breadcrumb-prev"><a href="">Home</a></li>
                            <span><i class="far fa-chevron-right"></i></span>
                            <li class="breadcrumb-items breadcrumb-current"><a href="">accounts</a></li>
                        </ol>
                    </nav>
                    <div class="accounts-title">
                        Accounts Management
                    </div>
                    <div class="accounts-status">
                        <div class="row">
                            <div class="col c-12">
                                <div class="row">
                                    <div class="col l-3 m-6 c-12">
                                        <div class="account-card border-green align-items-center d-flex">
                                            <div class="icon"><i class='bx bx-user-plus'></i></div>
                                            <div class="body">
                                                <div class="number">1,995</div>
                                                <div class="content">New Accounts</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col l-3 m-6 c-12">
                                        <div class="account-card border-orange align-items-center d-flex">
                                            <div class="icon"><i class='bx bx-user-check'></i></div>
                                            <div class="body">
                                                <div class="number">3,400</div>
                                                <div class="content">Active Accounts</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col l-3 m-6 c-12">
                                        <div class="account-card border-red align-items-center d-flex">
                                            <div class="icon"><i class='bx bx-station'></i></div>
                                            <div class="body">
                                                <div class="number">194</div>
                                                <div class="content">Online Accounts</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col l-3 m-6 c-12">
                                        <div class="account-card border-blue align-items-center d-flex">
                                            <div class="icon"><i class='bx bx-user-minus'></i></div>
                                            <div class="body">
                                                <div class="number">1,294</div>
                                                <div class="content">Be Disabled</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <section class="accounts-main">
                        <div class="accounts-overview">
                            <div class="overview-header">
                                <div class="overview-title">Accounts Breakdown</div>
                                <div class="overview-sub-title">Details and history</div>
                            </div>
                            <div class="overview-body">
                                <div class="overview-function d-flex align-items-center">
                                    <div class="search">
                                        <input type="text" name="search" placeholder="Search...">
                                    </div>
                                    <div class="sort-by d-flex align-items-center">
                                        <label for="form-orders" class="d-flex align-items-center"><i
                                                class='bx bx-sort'></i><span>Sort by:</span></label>
                                        <select name="form-orders" id="form-orders" class="form-select">
                                            <option value="default" selected="">Default</option>
                                            <option value="">User Name: A to Z</option>
                                            <option value="">User Name: Z to A</option>
                                            <option value="">Full Name: A to Z</option>
                                            <option value="">Full Name: Z to A</option>
                                            <option value="">Email: A to Z</option>
                                            <option value="">Email: Z to A</option>
                                            <option value="orderPayDateNewest">User Create date: Newest</option>
                                            <option value="orderPayDateOldest">User Create date: Oldest</option>
                                        </select>
                                    </div>
                                    <div class="filter d-flex align-items-center">
                                        <label for="form-orders" class="d-flex align-items-center"><i
                                                class='bx bx-filter-alt'></i></span>Filter by:</label>
                                        <select name="form-orders" id="form-orders" class="form-select">
                                            <option value="">Role: Admin</option>
                                            <option value="">Role: User</option>
                                        </select>
                                    </div>
                                    <div class="export"><a class="primary-btn" href="#"><button class="primary-btn"
                                                                                                type="button" name="export">Export To Excel</button></a></div>
                                </div>
                                <table class="table table-account-overview">
                                    <tr>
                                        <th>Username</th>
                                        <th>User Email</th>
                                        <th>User Fullname</th>
                                        <th>User Address</th>
                                        <th>User Create date</th>
                                        <th>User Avatar</th>
                                        <th>User Facebook</th>
                                        <th>User Role</th>
                                        <th></th>
                                        <th>Account State</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <td>QuangLNN</td>
                                        <td class="table-150-ellipsis">quanglnnde150066@fpt.edu.vn</td>
                                        <td>Lương Nguyễn Nhật Quang</td>
                                        <td>Thừa Thiên Huế</td>
                                        <td>27 May 2022</td>
                                        <td><img src="images/avatar/quang.jpg" alt=""></td>
                                        <td class="table-150-ellipsis">
                                            https://www.facebook.com/profile.php?id=100008194183640</td>
                                        <td><span class="status admin">Admin</span></td>
                                        <td><a href="#"><span class="status set-user">Set User</span></a></td>
                                        <td><span class="status active">Active</span></td>
                                        <td><a href="#"><span class="status set-disable">Set Disable</span></a></td>
                                    </tr>
                                    <tr>
                                        <td>Khoinmn</td>
                                        <td class="table-150-ellipsis">khoinmnde150323@fpt.edu.vn</td>
                                        <td>Nguyễn Mạnh Khôi</td>
                                        <td>Thừa Thiên Huế</td>
                                        <td>01 Oct 2022</td>
                                        <td><img src="images/avatar/khoi.jpg" alt=""></td>
                                        <td class="table-150-ellipsis">
                                            https://www.facebook.com/profile.php?id=100011319337285</td>
                                        <td><span class="status admin">Admin</span></td>
                                        <td><a href="#"><span class="status set-user">Set User</span></a></td>
                                        <td><span class="status active">Active</span></td>
                                        <td><a href="#"><span class="status set-disable">Set Disable</span></a></td>
                                    </tr>
                                    <tr>
                                        <td>Phuchnt</td>
                                        <td class="table-150-ellipsis">phuchnt@fpt.edu.vn</td>
                                        <td>Huynh Ngo Trieu Phuc</td>
                                        <td>Đắc Lắk</td>
                                        <td>08 Jan 2022</td>
                                        <td><img src="images/avatar/phuc.jpg" alt=""></td>
                                        <td class="table-150-ellipsis">https://www.facebook.com/phuchnt0801</td>
                                        <td><span class="status user">User</span></td>
                                        <td><a href="#"><span class="status set-admin">Set Admin</span></a></td>
                                        <td><span class="status active">Active</span></td>
                                        <td><a href="#"><span class="status set-disable">Set Disable</span></a></td>
                                    </tr>
                                    <tr>
                                        <td>Phuchnt</td>
                                        <td class="table-150-ellipsis">minhnn@fpt.edu.vn</td>
                                        <td>Nguyễn Nhật Minh</td>
                                        <td>Thừa Thiên Huế</td>
                                        <td>08 Jan 2022</td>
                                        <td><img src="images/avatar/minh.jpg" alt=""></td>
                                        <td class="table-150-ellipsis">
                                            https://www.facebook.com/profile.php?id=100074205810435</td>
                                        <td><span class="status user">User</span></td>
                                        <td><a href="#"><span class="status set-admin">Set Admin</span></a></td>
                                        <td><span class="status disable">Disable</span></td>
                                        <td><a href="#"><span class="status set-active">Set Active</span></a></td>
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
        <script type="text/javascript" src="js/admin-general.js"></script>
        <script>
//            Define active nav
            var nav__itemLists = document.querySelectorAll(".nav__item");
            nav__itemLists[3].classList.add("real-active", "active");
        </script>
    </body>

</html>
