<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="include/header.jsp"/>

<section class="py-5">
    <div class="container py-3 text-center pb-5">
        <h2>Search "${searchParam}"</h2>
    </div>
    <div class="container">
        <div class="row pt-3">
            <c:forEach items="${productList}" var="product">
                <div class="col-3 mb-5">
                    <div class="card border border-0" style="height: 450px;">
                        <a href="/team/${product.sportsTeam}/detail/${product.id}" style="text-decoration: none">
                            <img class="card-img-top" src="${product.imgUrl}" alt="">
                            <div class="card-body">
                                <p class="price">$${product.price}</p>
                                <h6 class="card-title mb-0 pb-0">${product.productName}</h6>
                            </div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    </div>
</section>



<jsp:include page="include/footer.jsp"/>