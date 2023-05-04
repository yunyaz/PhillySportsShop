<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="include/header.jsp"/>

<section>
    <div class="container">
        <div class="row justify-content-center">
            <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/pub/images/index/carousel/76ers.jpg" class="carouselImages d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/pub/images/index/carousel/flyers.jpg" class="carouselImages d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/pub/images/index/carousel/eagles.jpg" class="carouselImages d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/pub/images/index/carousel/phillies.jpg" class="carouselImages d-block w-100"
                             alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/pub/images/index/carousel/union.jpg" class="carouselImages d-block w-100" alt="...">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-5">
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