<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../include/header.jsp"/>

<section class="py-5" style="height: 900px">
    <div class="container text-center">
        <h2>My Account</h2>
    </div>
    <div class="container py-3">
        <div class="row mt-5">
            <div class="col-2"></div>
            <div class="col-4">
                <a style="color: black; text-decoration: none; text-decoration-color: black"
                   href="/account/myAccount/orderHistory">
                    <div class="card" style="height: 200px">
                        <div class="row justify-content-center">
                            <div class="col-4 text-center">
                                <img class="mt-5 pt-2" src="/pub/images/icons/account/order.svg" style="width: 60px">
                            </div>
                            <div class="col-8 py-5 mt-2">
                                <h5>Order History</h5>
                                <h6 class="mt-3 me-3">Easily check the status of orders</h6>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-4">
                <a style="color: black; text-decoration: none; text-decoration-color: black"
                   href="/account/myAccount/defaultAddress">
                    <div class="card" style="height: 200px">
                        <div class="row justify-content-center">
                            <div class="col-4 text-center">
                                <img class="mt-5 pt-2" src="/pub/images/icons/account/addressBook.svg"
                                     style="width: 65px">
                            </div>
                            <div class="col-8 py-5 mt-2">
                                <h5>Default Address</h5>
                                <h6 class="mt-3 me-3">Manage your saved addresses</h6>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-2"></div>
            <div class="col-4">
                <a style="color: black; text-decoration: none; text-decoration-color: black"
                   href="/account/myAccount/changeEmail">
                    <div class="card" style="height: 200px">
                        <div class="row justify-content-center">
                            <div class="col-4 text-center">
                                <img class="mt-5 pt-3" src="/pub/images/icons/account/email.svg" style="width: 50px">
                            </div>
                            <div class="col-8 py-5 mt-2">
                                <h5>Change Email Address</h5>
                                <h6 class="mt-3 me-3">Update your info to keep us connected</h6>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-4">
                <a style="color: black; text-decoration: none; text-decoration-color: black"
                   href="/account/myAccount/changePassword">
                    <div class="card" style="height: 200px">
                        <div class="row justify-content-center">
                            <div class="col-4 text-center">
                                <img class="mt-5 pt-2 ms-2" src="/pub/images/icons/account/password.svg"
                                     style="width: 65px">
                            </div>
                            <div class="col-8 py-5 mt-2">
                                <h5>Change Password</h5>
                                <h6 class="mt-3 me-3">Update your password to keep your account more secure</h6>
                            </div>
                        </div>
                    </div>
                </a>
            </div>

        </div>
    </div>
</section>

<jsp:include page="../../include/footer.jsp"/>