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
                        <div class="col-6">
                            <div class="container text-center">
                                <h3>Change Email Address</h3>
                            </div>
                            <c:if test="${success}">
                                <div class="alert text-center align-middle mt-5 py-5" role="alert"
                                     style="width: 400px; color: black; background-color: #f4f6f8">
                                    <i class="fa-solid fa-check fa-2xl" style="color: #434ea3;"></i>
                                    <h5 class="pt-4 pb-2">Email address was updated successfully!</h5>
                                    <a id="startShopping" href="/index"
                                       style="color: black; text-decoration-color: black"><h5
                                            class="pt-5 pb-2">Continue shopping</h5></a>
                                </div>
                            </c:if>
                            <c:if test="${!success}">
                                <form class="mt-5" action="/account/myAccount/changeEmailSubmit" method="POST">
                                    <div class="mb-3">
                                        <label for="email" class="form-label">New Email address*</label>
                                        <input type="text" class="form-control" id="email" name="email"
                                               aria-describedby="emailHelp"
                                               value="${form.email}">
                                        <c:if test="${bindingResult.hasFieldErrors('email')}">
                                            <c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">
                                                <div class="errorMessage"
                                                     style="color: red;">${error.getDefaultMessage()}</div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <div class="mb-3">
                                        <label for="confirmEmail" class="form-label">Confirm new email address*</label>
                                        <input type="text" class="form-control" id="confirmEmail" name="confirmEmail"
                                               aria-describedby="confirmEmailHelp"
                                               value="${form.confirmEmail}">
                                        <c:if test="${bindingResult.hasFieldErrors('confirmEmail')}">
                                            <c:forEach items="${bindingResult.getFieldErrors('confirmEmail')}"
                                                       var="error">
                                                <div class="errorMessage"
                                                     style="color: red;">${error.getDefaultMessage()}</div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <div class="mb-3">
                                        <label for="password" class="form-label">Password*</label>
                                        <input type="text" class="form-control" id="password" name="password"
                                               aria-describedby="passwordHelp">
                                        <c:if test="${bindingResult.hasFieldErrors('password')}">
                                            <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
                                                <div class="errorMessage"
                                                     style="color: red;">${error.getDefaultMessage()}</div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <div class="row" style="padding-left: 13px; padding-right: 13px">
                                        <button id="" type="submit" class="btn btn-dark mt-3">Change Email Address
                                        </button>
                                    </div>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../../include/footer.jsp"/>