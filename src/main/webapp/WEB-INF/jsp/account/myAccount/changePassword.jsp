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
                                <h3>Change Password</h3>
                            </div>
                            <c:if test="${success}">
                                <div class="alert text-center align-middle mt-5 py-5" role="alert"
                                     style="width: 400px; color: black; background-color: #f4f6f8">
                                    <i class="fa-solid fa-check fa-2xl" style="color: #434ea3;"></i>
                                    <h5 class="pt-4 pb-2">Password was updated successfully!</h5>
                                    <a id="startShopping" href="/index"
                                       style="color: black; text-decoration-color: black"><h5
                                            class="pt-5 pb-2">Continue shopping</h5></a>
                                </div>
                            </c:if>
                            <c:if test="${!success}">
                                <form class="mt-5" action="/account/myAccount/changePasswordSubmit" method="POST">
                                    <div class="mb-3">
                                        <label for="currentPassword" class="form-label">Current Password*</label>
                                        <input type="text" class="form-control" id="currentPassword"
                                               name="currentPassword"
                                               aria-describedby="currentPasswordHelp">
                                        <c:if test="${bindingResult.hasFieldErrors('currentPassword')}">
                                            <c:forEach items="${bindingResult.getFieldErrors('currentPassword')}"
                                                       var="error">
                                                <div class="errorMessage"
                                                     style="color: red;">${error.getDefaultMessage()}</div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <div class="mb-3">
                                        <label for="newPassword" class="form-label">New Password*</label>
                                        <input type="text" class="form-control" id="newPassword" name="newPassword"
                                               aria-describedby="newPasswordHelp">
                                        <div id="passwordHelp" class="form-text">Password must contain at least one
                                            uppercase letter,
                                            one lowercase letter, one digit, and one of !@#$ symbols
                                        </div>
                                        <c:if test="${bindingResult.hasFieldErrors('newPassword')}">
                                            <c:forEach items="${bindingResult.getFieldErrors('newPassword')}"
                                                       var="error">
                                                <div class="errorMessage"
                                                     style="color: red;">${error.getDefaultMessage()}</div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <div class="mb-3">
                                        <label for="confirmNewPassword" class="form-label">Confirm New Password*</label>
                                        <input type="text" class="form-control" id="confirmNewPassword"
                                               name="confirmNewPassword"
                                               aria-describedby="confirmNewPasswordHelp">
                                        <c:if test="${bindingResult.hasFieldErrors('confirmNewPassword')}">
                                            <c:forEach items="${bindingResult.getFieldErrors('confirmNewPassword')}"
                                                       var="error">
                                                <div class="errorMessage"
                                                     style="color: red;">${error.getDefaultMessage()}</div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <div class="row" style="padding-left: 13px; padding-right: 13px">
                                        <button id="" type="submit" class="btn btn-dark mt-3">Change Password
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