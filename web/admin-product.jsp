<%-- 
    Document   : admin-product
    Created on : Mar 27, 2022, 11:46:28 PM
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
        <link rel="stylesheet" href="css/admin-product.css">
        <!-- Style Admin General css -->
        <link rel="stylesheet" href="css/admin-general.css">
        <title>Products</title>
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
                            <li class="breadcrumb-items breadcrumb-current"><a href="">Product</a></li>
                        </ol>
                    </nav>
                    <div class="product-title">
                        Product Management
                    </div>
                    <div class="product-status">
                        <div class="product-nav">
                            <div class="overview-function d-flex align-items-center">
                                <div class="search">
                                    <input type="text" name="search" placeholder="Search...">
                                </div>
                                <div class="sort-by d-flex align-items-center">
                                    <label for="form-orders" class="d-flex align-items-center"><i
                                            class='bx bx-sort'></i><span>Sort by:</span></label>
                                    <select name="form-orders" id="form-orders" class="form-select">
                                        <option value="default" selected="">Default</option>
                                        <option value="AtoZ">Product Name: A to Z</option>
                                        <option value="ZtoA">Product Name: Z to A</option>
                                        <option value="lowtohigh">Price: Low to High</option>
                                        <option value="hightolow">Price: High to Low</option>
                                    </select>
                                </div>
                                <div class="filter d-flex align-items-center">
                                    <label for="form-orders" class="d-flex align-items-center"><i
                                            class='bx bx-filter-alt'></i></span>Filter by:</label>
                                    <select name="form-orders" id="form-orders" class="form-select">
                                        <option value="default" selected="">Default</option>
                                        <option value="black">Color: Black</option>
                                        <option value="blue">Color: Blue</option>
                                        <option value="green">Color: Green</option>
                                    </select>
                                </div>
                                <div class="export"><a class="primary-btn" href="#"><button class="primary-btn"
                                                                                            type="button" name="export">Export To Excel</button></a></div>
                            </div>
                        </div>

                        <div class="product-list">
                            <div class="row">
                                <div class="col l-3">
                                    <div class="product-item">
                                        <div class="image-part">
                                            <div class="image">
                                                <img src="images/productImage/1/1 (1).jpg" alt="">
                                            </div>
                                            <div class="options">
                                                <div class="delete d-flex justify-content-center align-items-center">
                                                    <i class='bx bx-trash'></i>
                                                </div>
                                                <div class="edit d-flex justify-content-center align-items-center">
                                                    <i class='bx bxs-edit'></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="body-part">
                                            <div class="item-title">
                                                Vintage Inspired Classic Vintage Inspired Classic
                                            </div>
                                            <div class="item-price">
                                                $ 25.90
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col l-3">
                                    <div class="product-item">
                                        <div class="image-part">
                                            <div class="image">
                                                <img src="images/productImage/1/1 (1).jpg" alt="">
                                            </div>
                                            <div class="options">
                                                <div class="delete d-flex justify-content-center align-items-center">
                                                    <i class='bx bx-trash'></i>
                                                </div>
                                                <div class="edit d-flex justify-content-center align-items-center">
                                                    <i class='bx bxs-edit'></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="body-part">
                                            <div class="item-title">
                                                Vintage Inspired Classic Vintage Inspired Classic
                                            </div>
                                            <div class="item-price">
                                                $ 25.90
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col l-3">
                                    <div class="product-item">
                                        <div class="image-part">
                                            <div class="image">
                                                <img src="images/productImage/1/1 (1).jpg" alt="">
                                            </div>
                                            <div class="options">
                                                <div class="delete d-flex justify-content-center align-items-center">
                                                    <i class='bx bx-trash'></i>
                                                </div>
                                                <div class="edit d-flex justify-content-center align-items-center">
                                                    <i class='bx bxs-edit'></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="body-part">
                                            <div class="item-title">
                                                Vintage Inspired Classic Vintage Inspired Classic
                                            </div>
                                            <div class="item-price">
                                                $ 25.90
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col l-3">
                                    <div class="product-item">
                                        <div class="image-part">
                                            <div class="image">
                                                <img src="images/productImage/1/1 (1).jpg" alt="">
                                            </div>
                                            <div class="options">
                                                <div class="delete d-flex justify-content-center align-items-center">
                                                    <i class='bx bx-trash'></i>
                                                </div>
                                                <div class="edit d-flex justify-content-center align-items-center">
                                                    <i class='bx bxs-edit'></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="body-part">
                                            <div class="item-title">
                                                Vintage Inspired Classic Vintage Inspired Classic
                                            </div>
                                            <div class="item-price">
                                                $ 25.90
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col l-3">
                                    <div class="product-item">
                                        <div class="image-part">
                                            <div class="image">
                                                <img src="images/productImage/1/1 (1).jpg" alt="">
                                            </div>
                                            <div class="options">
                                                <div class="delete d-flex justify-content-center align-items-center">
                                                    <i class='bx bx-trash'></i>
                                                </div>
                                                <div class="edit d-flex justify-content-center align-items-center">
                                                    <i class='bx bxs-edit'></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="body-part">
                                            <div class="item-title">
                                                Vintage Inspired Classic Vintage Inspired Classic
                                            </div>
                                            <div class="item-price">
                                                $ 25.90
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>

                </div>
            </div>

            <section class="modal" id="modal">
                <div class="modal-title">
                    Update This Product
                </div>
                <div class="modal-body">
                    <div class="modal-image-all">
                        <div class=""><img src="images/productImage/1/1 (1).jpg"></div>
                    </div>
                    <div class="modal-name">
                        <div>Product Name</div>
                        <input type="text" name="productName" value="Vintage Inspired Classic Vintage Inspired Classic">
                    </div>
                    <div class="modal-description">
                        <div>Product Description</div>
                        <input type="text" name="producDescription" value="Vintage Inspired Classic blabla">
                    </div>
                    <div class="modal-category">
                        <div class="form-check" style="display:inline">
                            <input type="radio" name="categoryID" value="" id="categoryID">
                            <label for="categoryID">
                                Sweeter
                            </label>
                        </div>
                        <div class="form-check" style="display:inline">
                            <input type="radio" name="categoryID" value="" id="categoryID-1">
                            <label for="categoryID-1">
                                Pants
                            </label>
                        </div>
                        <div class="form-check" style="display:inline">
                            <input type="radio" name="categoryID" value="" id="categoryID-2">
                            <label for="categoryID-2">
                                T-shirt
                            </label>
                        </div>
                    </div>
                    <div class="modal-number">
                        <div>Product Number</div>
                        <input type="number" min="0" name="productNumber" value="20">
                    </div>
                    <div class="modal-price">
                        <div>Product Price</div>
                        <input type="number" min="0" name="productNumber" value="300.0">
                    </div>
                    <div class="modal-image">
                        <div>Product Image</div>
                        <input type="file" name="image" size="60" accept="image/png, image/jpeg">
                    </div>
                    <div class="modal-button"><button type="button">Save</button></div>

                </div>
            </section>
        </div>
        <div id="modal-cover" class="modal-cover">
        </div>
        <!-- font awsomwe pro-->
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
    </body>

</html>