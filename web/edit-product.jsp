<%-- 
    Document   : edit-product
    Created on : Mar 23, 2022, 10:43:10 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                <form action="EditProductControl" method="post" enctype="multipart/form-data">
                    <div class="modal-content">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product</h4>
                                <button type="button"  onclick="location.href = 'ProductManagerControl';" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${detail.productID}" id="pid" name="id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Name<font color="red" id="message-pname"></font></label>
                                    <input value="${detail.productName}" id="pname" name="name" type="text" class="form-control" required>

                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input name="image" type="file" id="file-upload-1" />
                                    <input name="images" type="file" id="file-upload-2" multiple />
                                </div>
                                <div class="form-group">
                                    <label>Price</label>

                                    <input value="${detail.productPrice}" id="pprice" name="price" type="text" class="form-control" required>

                                </div>
                                <div class="form-group">
                                    <label>Number</label>
                                    <textarea name="number" id="pnumber" class="form-control" required>${detail.productNumber}</textarea>

                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="des" id="pdes" class="form-control" required>${detail.productDescription}</textarea>

                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listC}" var="o">
                                            <option ${categoryID == o.categoryID ? "selected" :""} value="${o.categoryID}">${o.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                    <br>

                                    <div> Color </div>
                                    <c:forEach items="${listCo}" var="o">
                                        <c:forEach items="${colordetail}" var="e">
                                            <c:if test="${e.colorID == o.colorID}">
                                                <c:set var="color" value="${e.colorID}"></c:set>
                                            </c:if>
                                        </c:forEach>
                                        <input ${color == o.colorID ? "checked" :""} name="color" type="checkbox"  value="${o.colorID}">${o.colorName} 
                                    </c:forEach>
                                    <label>Size</label>

                                    <c:forEach items="${sizedetail}" var="o">
                                        <c:if test="${o.sizeID == 'S'}">
                                            <c:set var="checked" value="checked"></c:set>
                                        </c:if>
                                    </c:forEach>
                                </div>

                                <input ${checked} name="size" type="checkbox"  value="S">S
                                <c:set var="checked" value=""></c:set>
                                <c:forEach items="${sizedetail}" var="o">
                                    <c:if test="${o.sizeID == 'M'}">
                                        <c:set var="checked" value="checked"></c:set>
                                    </c:if>
                                </c:forEach>
                                <c:set var="checked" value=""></c:set>
                                <c:forEach items="${sizedetail}" var="o">
                                    <c:if test="${o.sizeID == 'L'}">
                                        <c:set var="checked" value="checked"></c:set>
                                    </c:if>
                                </c:forEach>
                                <input ${checked} name="size" type="checkbox"  value="L">L
                                <c:set var="checked" value=""></c:set>


                                <c:forEach items="${sizedetail}" var="o">
                                    <c:if test="${o.sizeID == 'XL'}">
                                        <c:set var="checked" value="checked"></c:set>
                                    </c:if>
                                </c:forEach>
                                <input ${checked} name="size" type="checkbox"  value="XL">XL
                                <c:set var="checked" value=""></c:set>
                                <c:forEach items="${sizedetail}" var="o">
                                    <c:if test="${o.sizeID == '2XL'}">
                                        <c:set var="checked" value="checked"></c:set>
                                    </c:if>
                                </c:forEach>
                                <input ${checked} name="size" type="checkbox"  value="2XL">2XL
                                <c:set var="checked" value=""></c:set>
                                <c:forEach items="${sizedetail}" var="o">
                                    <c:if test="${o.sizeID == '3XL'}">
                                        <c:set var="checked" value="checked"></c:set>
                                    </c:if>
                                </c:forEach>
                                <input ${checked} name="size" type="checkbox"  value="3XL">3XL
                                <c:set var="checked" value=""></c:set>
                            </div>

                    </div>
                    <div class="modal-footer">
                        <button onclick="validate()" type="button" class="btn btn-success"></button>
                    </div>
                    </form>
                </div>
            </div>
        </div>





        <script src="js/manager.js" type="text/javascript"></script>

       







    </body>
</html>

