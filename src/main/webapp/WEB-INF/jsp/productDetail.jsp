<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

<section class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-7">
                <img class="productImage" src="${product.imgUrl}" alt="">
            </div>
            <div class="col-5">
                <form action="/order/addToCart" method="POST">
                    <input type="hidden" name="productId" value="${product.id}"/>
                    <div class="row mb-2">
                        <h5>${product.productName}</h5>
                    </div>
                    <div class="row ps-2 mb-3">
                        <div class="col-3 reviewRating">
                            <c:if test="${avgRating ne 5}">
                                <c:forEach var="i" begin="1" end="${5 - avgRating}">
                                    <input type="radio" id="reviewStar${i}" name="rating" value="${i}"/><label
                                        for="reviewStar${i}" id="uncheckedStar"></label>
                                </c:forEach>
                            </c:if>
                            <c:forEach var="i" begin="${5 - avgRating + 1}" end="5">
                                <input type="radio" id="reviewStar${i}" name="rating" value="${i}"/><label
                                    for="reviewStar${i}" id="checkedStar"></label>
                            </c:forEach>
                        </div>
                        <div class="col" style="padding-top: 2px">
                            <a style="color: black" href="#readReviews">(Read ${reviews.size()} Reviews)</a>
                        </div>
                    </div>

                    <div class="row mb-5">
                        <h6>$${product.price}</h6>
                    </div>
                    <div class="mb-5">
                        <div class="col-3">
                            <h6>Size</h6>
                            <c:if test="${(product.category eq 'Hats') || (product.category eq 'Accessories') || (product.category eq 'Collectibles')}">
                                <button type="button" class="btn" style="border-color: lightgrey">One Size</button>
                            </c:if>
                            <c:if test="${(product.category ne 'Hats') && (product.category ne 'Accessories') && (product.category ne 'Collectibles')}">
                                <select id="size" name="size" class="form-select" aria-label="select size"
                                        style="width: 100px;">
                                    <c:forEach items="${jerseySize}" var="size">
                                        <option value="${size}">${size}</option>
                                    </c:forEach>
                                </select>
                            </c:if>
                        </div>
                    </div>
                    <div class="mb-5">
                        <h6>Quantity</h6>
                        <div class="row">
                            <div class="col-3">
                                <select id="quantity" name="quantity" class="form-select" aria-label="select quantity"
                                        style="width: 100px;">
                                    <c:forEach items="${quantityList}" var="quantity">
                                        <option value="${quantity}">${quantity}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <c:if test="${product.quantityInStock > 0 && product.quantityInStock < 20}">
                                <div class="col pt-2" style="color: mediumseagreen">
                                    Low Stock
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <c:if test="${product.quantityInStock eq 0}">
                        <div class="row mb-5 mx-1">
                            <button type="button" class="btn btn-secondary">Out of Stock</button>
                        </div>
                    </c:if>
                    <c:if test="${product.quantityInStock > 0}">
                        <div class="row mb-5 mx-1">
                            <button type="submit" class="btn btn-dark">Add to Cart</button>
                        </div>
                    </c:if>
                    <div class="mb-5">
                        <h6>Description</h6>
                        <p>${product.description}</p>
                    </div>
                </form>
                <c:if test="${ordered == true}">
                    <div>
                        <p>
                            <button class="btn btn-dark" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseExample" aria-expanded="false"
                                    aria-controls="collapseExample">
                                Write a review
                            </button>
                        </p>
                        <div class="collapse" id="collapseExample">
                            <form action="/account/reviewSubmit" method="POST">
                                <input type="hidden" name="productId" value="${product.id}"/>
                                <div class="row pb-3">
                                    <div class="rating">
                                        <input type="radio" id="star5" name="rating" value="5"/><label
                                            for="star5"></label>
                                        <input type="radio" id="star4" name="rating" value="4"/><label
                                            for="star4"></label>
                                        <input type="radio" id="star3" name="rating" value="3"/><label
                                            for="star3"></label>
                                        <input type="radio" id="star2" name="rating" value="2"/><label
                                            for="star2"></label>
                                        <input type="radio" id="star1" name="rating" value="1"/><label
                                            for="star1"></label>
                                    </div>
                                </div>
                                <div class="row">
                                     <textarea id="comment" name="comment" class="form-control ms-2 mb-3" rows="5"
                                               style="width: 800px"
                                               aria-describedby="descriptionHelp"></textarea>
                                </div>
                                <button type="submit" class="btn btn-dark mb-3">Submit</button>
                            </form>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</section>

<section class="pt-2 pb-5">
    <div class="container">
        <a id="readReviews"><h4>Reviews (${reviews.size()})</h4></a>
        <hr>
        <c:if test="${empty reviews && ordered}">
            <div>Not yet rated. Be the first to review this item.</div>
        </c:if>
        <c:if test="${not empty reviews}">
            <c:forEach items="${reviews}" var="review">
                <div class="row">
                    <div class="col-4">
                        <div class="mb-2">${review.getDate().toString().substring(0, 10)}</div>
                        <div>By ${review.getUser().getFirstName()}</div>
                        <c:if test="${not empty review.getUser().getCity()}">
                            <div>From ${review.getUser().getCity()}, ${review.getUser().getState()}</div>
                        </c:if>
                    </div>
                    <div class="col-8">
                        <div class="row mb-1">
                            <div class="reviewRating">
                                <c:if test="${review.getRating() ne 5}">
                                    <c:forEach var="i" begin="1" end="${5 - review.getRating()}">
                                        <input type="radio" id="reviewStar${i}" name="rating" value="${i}"/><label
                                            for="reviewStar${i}" id="uncheckedStar"></label>
                                    </c:forEach>
                                </c:if>
                                <c:forEach var="i" begin="${5 - review.getRating() + 1}" end="5">
                                    <input type="radio" id="reviewStar${i}" name="rating" value="${i}"/><label
                                        for="reviewStar${i}" id="checkedStar"></label>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="row">
                                ${review.getComment()}
                        </div>
                    </div>
                </div>
                <hr>
            </c:forEach>
        </c:if>
    </div>
    </div>
</section>

<jsp:include page="include/footer.jsp"/>