<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="include/header.jsp"/>

<section class="border-bottom">
    <ul class="nav justify-content-evenly">
        <c:forEach items="${categoryList}" var="category">
            <li class="nav-item">
                <a class="nav-link category-link" href="/team/${teamName}/${category.toLowerCase()}">${category}</a>
            </li>
        </c:forEach>
    </ul>
</section>

<section class="mt-5" <c:if test="${empty productList}"> style="height: 700px" </c:if>>
    <div class="container">
        <div class="row pt-3">
            <c:forEach items="${productList}" var="product">
                <div class="col-3 mb-5">
                    <div class="card border border-0" style="height: 450px;">
                        <a id="productCard" href="/team/${product.sportsTeam}/detail/${product.id}">
                            <img class="card-img-top" src="${product.imgUrl}" alt="">
                            <div class="card-body">
                                <p id="price" style="color: #575a5e">$${product.price}</p>
                                <h6 id="productName" class="card-title mb-0 pb-0" style="color: #575a5e">${product.productName}</h6>
                            </div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<jsp:include page="include/footer.jsp"/>