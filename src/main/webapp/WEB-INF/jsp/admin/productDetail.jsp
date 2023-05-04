<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<section class="pt-5 pb-3">
    <div class="container text-center">
        <h1>Product Detail</h1>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6">
                <a class="btn btn-primary mb-5" href="/admin/edit/${product.id}">Edit Product</a>
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>id</th>
                        <td>${product.id}</td>
                    </tr>
                    <tr>
                        <th>Product Name</th>
                        <td>${product.productName}</td>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <td>${product.price}</td>
                    </tr>
                    <tr>
                        <th>Quantity In Stock</th>
                        <td>${product.quantityInStock}</td>
                    </tr>
                    <tr>
                        <th>Sports Team</th>
                        <td>${product.sportsTeam}</td>
                    </tr>
                    <tr>
                        <th>Category</th>
                        <td>${product.category}</td>
                    </tr>
                    <tr>
                        <th>Description</th>
                        <td>${product.description}</td>
                    </tr>
                    <tr>
                        <th>Image</th>
                        <td><img style="width: 300px" src="${product.imgUrl}"></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>