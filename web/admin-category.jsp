<%-- 
    Document   : admin-category
    Created on : Mar 28, 2022, 12:01:38 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="css/admin-category.css">
        <!-- Style Admin General css -->
        <link rel="stylesheet" href="css/admin-general.css">
        <title>Categorys</title>
    </head>

    <body>
        <div class="container">
            <!--header-aside-->
            <jsp:include page="admin-header-aside-importer.jsp"></jsp:include>
                <!-- Right Side/ Content -->
                <div class="main">
                <jsp:include page="admin-header-importer.jsp"></jsp:include>
                    <div class="categorys">
                        <nav class="breadcrumb">
                            <ol class="breadcrumb-list d-flex">
                                <li class="breadcrumb-items breadcrumb-prev"><a href="">Home</a></li>
                                <span><i class="far fa-chevron-right"></i></span>
                                <li class="breadcrumb-items breadcrumb-current"><a href="">Categories</a></li>
                            </ol>
                        </nav>
                        <div class="categorys-title">
                            Categories Management
                        </div>

                        <div class="categorys-status">
                            <div class="row">
                                <div class="col c-12">
                                    <div class="row">
                                        <div class="col l-3 m-6 c-12">
                                            <div class="category-card border-green align-items-center d-flex">
                                                <div class="icon"><i class='bx bx-duplicate'></i></div>
                                                <div class="body">
                                                    <div class="number">1,995</div>
                                                    <div class="content">New Category</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col l-3 m-6 c-12">
                                            <div class="category-card border-blue align-items-center d-flex">
                                                <div class="icon"><i class='bx bx-category'></i></div>
                                                <div class="body">
                                                    <div class="number">1,294</div>
                                                    <div class="content">Total Category</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <section class="categorys-main">
                            <div class="categorys-overview">
                                <div class="overview-header">
                                    <div class="overview-title">categorys Breakdown</div>
                                    <div class="overview-sub-title">Details and history</div>
                                </div>
                                <div class="overview-body">
                                    <div class="overview-function d-flex align-items-center">
                                        <form action="SearchCategoryAdmin" method="post">
                                            <div class="search">
                                                <input oninput="searchAjax(this)" value="${txtS}" name="txt" type="text" placeholder="Search">
                                            <button type="submit">
                                               Search
                                            </button>
                                        </div>
                                    </form>
                                    <div class="sort-by d-flex align-items-center">
                                        <label for="form-orders" class="d-flex align-items-center"><i
                                                class='bx bx-sort'></i><span>Sort by:</span></label>
                                        <select name="form-orders" id="form-orders" class="form-select" onchange="window.location=this.value">
                                            <option value="LoadCategoryControl" selected="">Default</option>
                                            <option value="SortCategoryAdmin?sort=M">Category Name: A to Z</option>
                                            <option value="SortCategoryAdmin?sort=C">Category Name: Z to A</option>
                                            
                                        </select>
                                    </div>
                                    <div><a class="primary-btn" href="add-category.jsp"><button class="primary-btn"
                                                                                                type="button">Add category</button></a></div>
                                </div>
                                <table class="table table-category-overview">

                                    <tr>
                                        <th scope="col">Category ID</th>
                                        <th scope="col">Category Name</th>

                                    </tr>
                                    <!--                                    <tr>
                                                                            <td>1</td>
                                                                            <td>Shopping Bag</td>
                                                                            <td>fas fa-shopping-bag</td>
                                                                            <td><i class="fas fa-shopping-bag"></i></td>
                                                                            <td>
                                                                                <div class="edit d-flex justify-content-center align-items-center">
                                                                                    <i class='bx bxs-edit'></i>
                                                                                </div>
                                                                            </td>
                                                                        </tr>-->

                                    <c:forEach items="${listC}" var="o"> 

                                        <tr id="category-form">

                                            <td>${o.categoryID}</td>
                                            <td>${o.categoryName}</td>

                                            <!--                                        <td><i class="fas fa-shopping-bag"></i></td>-->
                                            <td>
                                                <div class="edit d-flex justify-content-center align-items-center">
                                                    <i class='bx bxs-edit' onclick="getCategory(${o.categoryID});"> </i>
                                                </div>
                                            </td>
                                        </tr>




                                    </c:forEach>

                                </table>

                            </div>

                        </div>
                    </section>
                </div>
            </div>
        </div>
        <section class="modal" id="modal">
            <form id="edit-form" action="EditCategoryControl" method="post">
            <div class="modal-title">
                Update This Category
            </div>
            
            <div id="modal-body" class="modal-body">
                <input type="hidden" name="cid" value="${detail.categoryID}">
                <div class="modal-name">
                    <div>Category Name</div>
                    <input type="text" name="cname" value="${detail.categoryName}">
                </div>
                
                <div class="modal-button"><button type="button" onclick="validate()">Save</button></div>

            </div>
            </form>
        </section>
    </div>
    <div id="modal-cover" class="modal-cover">
    </div>
    <!-- font awsomwe pro-->
    
    <script src="font-awesome-pro-master/js/pro.min.js"></script>
    <script type="text/javascript" src="js/admin-general.js"></script>
    <script>
        const modal = document.querySelector('#modal');
        const modalCover = document.querySelector('#modal-cover');
        const edits = document.querySelectorAll('.edit');

        Array.from(edits).forEach(edit => edit.addEventListener('click', (e) => {
                modal.classList.add('active');
                modalCover.classList.add('active');
            }))

        modalCover.addEventListener('click', (e) => {
            modal.classList.remove('active');
            modalCover.classList.remove('active');
        })

    </script>
    <script>
//            Define active nav
        var nav__itemLists = document.querySelectorAll(".nav__item");
        nav__itemLists[4].classList.add("real-active", "active");
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function searchAjax(param) {
            var txtSearch = param.value;
            $.ajax({
                url: "/FsoftOnlineShopping/SearchCategoryAdmin",
                type: "get", //send it through get method
                data: {
                    txt: txtSearch
                },
                success: function (data) {
                    var row = document.getElementById("category-form");
                    row.innerHTML = data;
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            })

        }
        

        function showModal() {
            const modal = document.querySelector('#modal');
            const modalCover = document.querySelector('#modal-cover');

            modal.classList.add('active');
            modalCover.classList.add('active');
        }
        
        function validate(){
            var name = $("#name").val();
            console.log("check " + name);
            $.ajax({
                url: "EditCategoryControl",
                type: "GET",
                data: {
                    cname: name
                },
                success: function(data) {
                    console.log(data);
                    if(data == "not_exist") {
                        $("#edit-form").submit();
                    } else if (data == "exist") {
                        alert("Category name exist!");
                    } else alert("Error");                
                }
            });
        }
    </script>
    <script>
            function getCategory(cid) {
                var id = cid;
                $.ajax({
                    url: "/FsoftOnlineShopping/LoadEditCategory",
                    type: "get", //send it through get method
                    data: {
                        caid: id
                    },
                    success: function (data) {
                        var row = document.getElementById("modal-body");
                        row.innerHTML = data;
                        
                        
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                })
            }
        </script>
</body>

</html>
