<%-- 
    Document   : admin-header-aside-importer
    Created on : Mar 16, 2022, 8:30:21 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="header-aside">
    <nav class="nav">
        <div class="nav__logo d-flex">
            <div class="nav__logo-image"><a href=""><img class="left" src="images/icons/logo-02.png"
                                                         alt="COZA STORE"></a>
            </div>
        </div>
        <div class="nav__menu">
            <ul class="nav__list">
                <li class="nav__item ">
                    <a href="admin-dashboard.jsp" class="nav__link d-flex">
                        <span class="icon"><i class='bx bx-home-alt'></i></span>
                        <span class="title">Dashboard</span>
                    </a>
                </li>
                <li class="nav__item">
                    <a href="CartManagerControl" class="nav__link d-flex">
                        <span class="icon"><i class='bx bx-cart'></i></span>
                        <span class="title">Orders</span>
                    </a>
                </li>
<!--                <li class="nav__item">
                    <a href="#" class="nav__link d-flex">
                        <span class="icon"><i class='bx bx-line-chart'></i></span>
                        <span class="title">Statistics</span>
                    </a>
                </li>-->
                <li class="nav__item">
                    <a href="ProductManagerControl" class="nav__link d-flex">

                        <span class="icon"><i class='bx bx-package'></i></span>
                        <span class="title">Products</span>
                    </a>
                </li>
                <li class="nav__item">
                    <a href="admin-account.jsp" class="nav__link d-flex">
                        <span class="icon"><i class='bx bx-user'></i></span>
                        <span class="title">Accounts</span>
                    </a>
                </li>
                <li class="nav__item">
                    <a href="admin-category.jsp" class="nav__link d-flex">
                        <span class="icon"><i class='bx bx-category'></i></span>
                        <span class="title">Category</span>
                    </a>
                </li>

<!--                <li class="nav__item">
                    <a href="#" class="nav__link d-flex">
                        <span class="icon"><i class='bx bx-food-menu'></i></span>
                        <span class="title">Profile</span>
                    </a>
                </li>-->

                <li class="nav__item">
                    <a href="#" class="nav__link d-flex">
                        <span class="icon"><i class='bx bx-log-out'></i></span>
                        <span class="title">Sign out</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <script src="js/handle-sign-out-admin.js"></script>

</aside>

