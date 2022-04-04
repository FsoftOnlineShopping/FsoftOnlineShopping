<%-- 
    Document   : admin-product
    Created on : Mar 27, 2022, 11:46:28 PM
    Author     : ADMIN
--%>

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
        <link rel="stylesheet" href="css/admin-product.css">
        <!-- Style Admin General css -->
        <link rel="stylesheet" href="css/admin-general.css">
        <!--CSS library of MultiSelect plugin -->
        <link rel="stylesheet" href="https://phpcoder.tech/multiselect/css/jquery.multiselect.css">
        <title>Products</title>
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


                    <form action="AddProductControl" method="post" enctype="multipart/form-data" onsubmit="return validate()">
                        <div class="modal-title">
                            Create Product
                        </div>
                        <div id="modal-body" class="modal-body">

                            <div class="modal-name">
                                <div>Product Name</div>
                                <input type="text" name="name" value="${detail.productName}">
                        </div>
                        <div class="modal-description">
                            <div>Product Description</div>
                            <input type="text" name="des" value="${detail.productDescription}">
                        </div>
                        <div class="modal-category">
                            <div> Category </div>
                            <select name="category" class="form-select" aria-label="Default select example">
                                <c:forEach items="${listC}" var="o">
                                    <option value="${o.categoryID}">${o.categoryName}</option>
                                </c:forEach>
                            </select>
                            <div> Color </div>
                            <select name="color" multiple id="colorSelect">
                                <c:forEach items="${listCo}" var="o">
                                    <option name="color" type="checkbox" value="${o.colorID}">${o.colorName} </option>
                                </c:forEach>
                            </select>

                            <div id="sizeSelect">
                                <div>Size</div>
                                <input name="size" type="checkbox"  value="S">S
                                <input name="size" type="checkbox"  value="M">M
                                <input name="size" type="checkbox"  value="L">L
                                <input name="size" type="checkbox"  value="XL">XL 
                                <input name="size" type="checkbox"  value="2XL">2XL 
                                <input name="size" type="checkbox"  value="3XL">3XL
                            </div>

                        </div>
                        <div class="modal-number">
                            <div>Product Number</div>
                            <input type="number" min="0" name="number" value="  ${detail.productNumber}">
                        </div>
                        <div class="modal-price">
                            <div>Product Price</div>
                            <input type="number" min="0" name="price" value="${detail.productPrice}">
                        </div>
                        <div class="modal-image">
                            <div>Product Image</div>
                            <label>Image</label>
                            <input name="image" type="file" size="60"  id="file-upload-1" accept="image/png, image/jpeg" required  />
                            <input name="images" type="file" size="60" id="file-upload-2" accept="image/png, image/jpeg" multiple required />

                        </div>
                        <div class="modal-button">
                            <div class="modal-footer">
                                <input type="submit" value="Add">
                            </div>
                        </div>

                    </div>
                </form>

            </div>

            <!-- font awsomwe pro-->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://phpcoder.tech/multiselect/js/jquery.multiselect.js"></script>    
            <script src="font-awesome-pro-master/js/pro.min.js"></script>
            <script type="text/javascript" src="js/admin-general.js"></script>
            <script>
        //            Define active nav
                var nav__itemLists = document.querySelectorAll(".nav__item");
                nav__itemLists[2].classList.add("real-active", "active");
            </script>
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
                $('#colorSelect').multiselect({
                    columns: 1,
                    placeholder: 'Select Colors',
                    search: true,
                    selectAll: true
                });
            </script>
            <script>
                function validate() {
                    var isError = false;
                    if($("#colorSelect").next(".ms-options-wrap").find("li.selected").length === 0) {
                        alert("must choose at least one color");
                        isError = true;
                    }
                    if($("input[name=size]:checked").length === 0) {
                        alert("must choose at least one size");
                        isError = true;
                    }

                    return !isError;
                }                                    
            </script>
    </body>

</html>