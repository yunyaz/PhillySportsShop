<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../include/header.jsp"/>

<section class="py-5" style="height: 900px">
    <div class="container">
        <div class="row">
            <div class="col-3">
                <h3 class="pb-2">My account</h3>
                <hr>
                <div class="row mt-3 pt-3">
                    <a style="color: black; text-decoration: none; text-decoration-color: black"
                       href="/account/myAccount/orderHistory">
                        <img class="me-1" src="/pub/images/icons/account/order.svg" style="width: 20px">
                        Order History
                    </a>
                </div>
                <div class="row mt-3">
                    <a style="color: black; text-decoration: none; text-decoration-color: black"
                       href="/account/myAccount/defaultAddress">
                        <img class="me-1" src="/pub/images/icons/account/addressBook.svg" style="width: 20px">
                        Default Address
                    </a>
                </div>
                <div class="row mt-3">
                    <a style="color: black; text-decoration: none; text-decoration-color: black"
                       href="/account/myAccount/changeEmail">
                        <img class="me-1" src="/pub/images/icons/account/email.svg" style="width: 20px">
                        Change Email Address
                    </a>
                </div>
                <div class="row mt-3">
                    <a style="color: black; text-decoration: none; text-decoration-color: black"
                       href="/account/myAccount/changePassword">
                        <img class="me-1" src="/pub/images/icons/account/password.svg" style="width: 20px">
                        Change Password
                    </a>
                </div>
            </div>
            <div class="col">
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col">
                        <div class="col-8">
                            <div class="container">
                                <h3 class="pb-2">Order History</h3>
                            </div>
                            <hr>
                            <c:forEach items="${orders}" var="order">
                                <c:if test="${order.getStatus() ne 'cart'}">
                                    <div class="row pt-2">
                                        <div class="col-4">
                                            <h6>Order#: ${order.getId()}</h6>
                                        </div>
                                        <div class="col-4">
                                            <h6>Date: ${order.getOrderDate().toString().substring(0, 10)}</h6>
                                        </div>
                                        <div class="col-4">
                                            <h6>Status: ${order.getStatus()}</h6>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <c:forEach items="${order.getOrderProductList()}" var="orderProduct">
                                            <div class="col-3 pt-3">
                                                <a id="cartImageLink"
                                                   href="/team/${orderProduct.getProduct().getSportsTeam()}/detail/${orderProduct.getProduct().getId()}">
                                                    <img class="cartImage"
                                                         src="${orderProduct.getProduct().getImgUrl()}"
                                                         style="width: 100px">
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <hr>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../../include/footer.jsp"/>