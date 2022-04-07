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


                <form id="add-form" action="AddCategoryControl" method="post">
                    <div class="modal-title">
                        Create Category
                    </div>
                    <div id="modal-body" class="modal-body">

                        <div class="modal-name">
                            <div>Category Name</div>
                            <input id="name" type="text" name="cname" required>
                        </div>


                        <div class="modal-button">
                            <div class="modal-footer">
                                <input type="button" value="Add" onclick="validate()">
                            </div>
                        </div>

                    </div>
                </form>

            </div>
            <div id="modal-cover" class="modal-cover">
            </div>
            <!-- font awsomwe pro-->
            <script src="font-awesome-pro-master/js/pro.min.js"></script>
            <script type="text/javascript" src="js/admin-general.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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


                function validate() {
                    var name = $("#name").val();
                    console.log("check " + name);
                    $.ajax({
                        url: "EditCategoryControl",
                        type: "GET",
                        data: {
                            cname: name
                        },
                        success: function (data) {
                            console.log(data);
                            if (data == "not_exist") {
                                $("#add-form").submit();
                            } else if (data == "exist") {
                                alert("Category name exist!");
                            } else
                                alert("Error");
                        }
                    });
                }
            </script>
    </body>

</html>
