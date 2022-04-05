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
        <title>Products Manager</title>
    </head>

    <body>
        <div class="container">
            <!--header-aside-->
            <jsp:include page="admin-header-aside-importer.jsp"></jsp:include>
                <!-- Right Side/ Content -->
                <div class="main">
                    <jsp:include page="admin-header-importer.jsp"></jsp:include>
                    <div class="product">
                        <nav class="breadcrumb">
                            <ol class="breadcrumb-list d-flex">
                                <li class="breadcrumb-items breadcrumb-prev"><a href="">Home</a></li>
                                <span><i class="far fa-chevron-right"></i></span>
                                <li class="breadcrumb-items breadcrumb-current"><a href="ProductManagerControl">Product</a></li>
                            </ol>
                        </nav>
                        <div class="product-title">
                            Product Management
                        </div>
                        <div class="product-status">
                            <div class="product-nav">
                                <div class="overview-function d-flex align-items-center">
                                    <div class="search">
                                        <input oninput="searchAjax(this)" value="${txtS}" name="txt" type="text" placeholder="Search">

                                </div>
                                <div class="sort-by d-flex align-items-center">
                                   <label for="form-orders" class="d-flex align-items-center"><i
                                            class='bx bx-filter-alt'></i></span>Filter by:</label>
                                    <select name="form-order" id="form-orders" class="form-select"  onchange="window.location=this.value">
                                     <option value="ProductManagerControl" >Default</option> 
                                    <c:forEach items="${listC}" var="o">
                                       <option ${categoryID == o.categoryID ? "selected" :""} value="CategoryForManagerControl?categoryID=${o.categoryID}">${o.categoryName}</option>
                                    </c:forEach>

                                    </select>
                                </div>
                                <div class="filter d-flex align-items-center">
                                    <label for="form-orders" class="d-flex align-items-center"><i
                                            class='bx bx-filter-alt'></i></span>Filter by:</label>
                                    <select name="form-orders" id="form-orders" class="form-select" onchange="window.location=this.value">
                                        <option value="ProductManagerControl">Default</option>
                                        <c:forEach items="${listCo}" var="o">
                                        <option ${colorID == o.colorID ? "selected" :""} value="ColorForManagerControl?colorID=${o.colorID}">Color: ${o.colorName}</option>
                                        </c:forEach>
<!--                                        <option value="blue">Color: Blue</option>
                                        <option value="green">Color: Green</option>-->
                                    </select>
                                </div>
                                <!--                            <div class="export"><a class="primary-btn" href="#"><button class="primary-btn"
                                                                        type="button" name="export">Export To Excel</button></a></div>
                                                        </div>-->
                                <div><a class="primary-btn" href="LoadAddProductControl"><button class=" primary-btn"
                                                                                                 type="button" >Create Product</button></a></div>
                            </div>
                        </div>

                        <div class="product-list">
                            <div id="product-tag" class="row">
                                <c:forEach items="${listP}" var="o">
                                    <div  class="col l-3">
                                        <div class="product-item">
                                            <div class="image-part">
                                                <div class="image">
                                                    <img src="${o.imageFolder}/${o.productID} (1).jpg" alt="IMG-PRODUCT">
                                                </div>
                                                <div class="options">
                                                    <div class="delete d-flex justify-content-center align-items-center">
                                                        <i  onclick="location.href = 'DeleteProductControl?productID=${o.productID}';" class='bx bx-trash'></i>
                                                    </div>
                                                    <div class="edit d-flex justify-content-center align-items-center">
                                                        <i onclick="getProduct(${o.productID});" class='bx bxs-edit'></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="body-part">
                                                <div class="item-title">
                                                    ${o.productName}
                                                </div>
                                                <div class="item-price">
                                                    $${o.productPrice}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>



                            </div>
                        </div>


                    </div>

                </div>
            </div>

            <section class="modal" id="modal">
                <form id="edit-form" action="EditProductControl" method="post" onsubmit="return validate()" enctype="multipart/form-data">
                    <div class="modal-title">
                        Update This Product
                    </div>
                    <div id="modal-body" class="modal-body">
                        <div class="modal-image-all">
                            <div class=""><img src="${detail.imageFolder}/${detail.productID} (1).jpg" alt="IMG-PRODUCT"></div>
                        </div>
                        <div class="modal-name">
                            <div>Product Name</div>
                            <input type="text" name="name" value="${detail.productName}" required>
                        </div>
                        <div class="modal-description">
                            <div>Product Description</div>
                            <input type="text" name="des" value="${detail.productDescription}" required>
                        </div>
                        <div class="modal-category">
                            <div> Category </div>
                            <select name="category" class="form-select" aria-label="Default select example">
                                <c:forEach items="${listC}" var="o">
                                    <option value="${o.categoryID}">${o.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="modal-number">
                            <div>Product Number</div>
                            <input type="number" min="0" name="number" value="${detail.productNumber}" required>
                        </div>
                        <div class="modal-price">
                            <div>Product Price</div>
                            <input type="number" min="0" name="number" value="${detail.productPrice}" required>
                        </div>
                        <div class="modal-image">
                            <div>Product Image</div>
                            <label>Image</label>
                            <input name="image" type="file" size="60"  id="file-upload-1" accept="image/png, image/jpeg" required  />
                            <input name="images" type="file" size="60" id="file-upload-2" accept="image/png, image/jpeg" multiple required />

                        </div>
                        <div class="modal-button">
                            <div class="modal-footer">
                                <input type="submit" value="Save">
                            </div>
                        </div>

                    </div>
                </form>
            </section>
        </div>
        <div id="modal-cover" class="modal-cover">
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
            function getProduct(pid) {
                var id = pid;
                $.ajax({
                    url: "/FsoftOnlineShopping/LoadProductControl",
                    type: "get", //send it through get method
                    data: {
                        pid: id
                    },
                    success: function (data) {
                        var row = document.getElementById("modal-body");
                        row.innerHTML = data;
                        
                        $('#colorSelect').multiselect({
                            columns: 1,
                            placeholder: 'Select Colors',
                            search: true,
                            selectAll: true
                        });
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                })
            }
        </script>
        <script>
            function searchAjax(param) {
                var txtSearch = param.value;
                $.ajax({
                    url: "/FsoftOnlineShopping/SearchProductAdmin",
                    type: "get", //send it through get method
                    data: {
                        txt: txtSearch
                    },
                    success: function (data) {
                        var row = document.getElementById("product-tag");
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