<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<section class="py-5">
    <div class="container text-center">
        <h1>Search Product</h1>
    </div>
</section>

<section class="py-3">
    <div class="container">
        <div class="row text-center justify-content-center">
            <div class="col-5">
                <form>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" name="searchProduct" placeholder="Search" value="${searchParam}"
                               aria-label="Product Name">
                    </div>
                    <button id="submitBtn" type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>

    </div>
</section>

<section class="py-5">
    <div class="container text-center">
        <h4 class="pb-3">${productList.size()} Search Results</h4>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity In Stock</th>
                <th scope="col">Sports Team</th>
                <th scope="col">Category</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${productList}" var="product">
                <tr>
                    <th><a href="/admin/detail/${product.id}">${product.id}</a></th>
                    <td>${product.productName}</td>
                    <td>${product.price}</td>
                    <td>${product.quantityInStock}</td>
                    <td>${product.sportsTeam}</td>
                    <td><a href="/admin/edit/${product.id}">Edit</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</section>



<jsp:include page="../include/footer.jsp"/>