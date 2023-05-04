<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../include/header.jsp"/>

<section class="py-5" style="height: 1100px">
    <div class="container">
        <div class="row justify-content-center">
            <c:if test="${success}">
                <div class="alert text-center align-middle mt-5 py-5" role="alert"
                     style="width: 400px; color: black; background-color: #f4f6f8">
                    <i class="fa-solid fa-check fa-2xl" style="color: #434ea3;"></i>
                    <h5 class="pt-4 pb-2">Thank you for your order!</h5>
                    <a id="startShopping" href="/index"
                       style="color: black; text-decoration-color: black"><h5
                            class="pt-5 pb-2">Continue shopping</h5></a>
                </div>
            </c:if>
            <c:if test="${!success}">
                <div class="col-7">
                    <h3>Checkout</h3>
                    <hr>
                    <form action="/order/checkoutSubmit" method="POST">
                        <h5 class="pt-3 mb-4">Shipping Address</h5>
                        <div class="row">
                            <div class="col">
                                <div class="mb-3">
                                    <label for="firstName" class="form-label">First Name*</label>
                                    <input type="text" class="form-control" id="firstName" name="firstName"
                                           aria-describedby="firstNameHelp" value="${form.firstName}">
                                    <c:if test="${bindingResult.hasFieldErrors('firstName')}">
                                        <c:forEach items="${bindingResult.getFieldErrors('firstName')}" var="error">
                                            <div class="errorMessage"
                                                 style="color: red;">${error.getDefaultMessage()}</div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col">
                                <div class="mb-3">
                                    <label for="lastName" class="form-label">Last Name*</label>
                                    <input type="text" class="form-control" id="lastName" name="lastName"
                                           aria-describedby="lastNameHelp" value="${form.lastName}">
                                    <c:if test="${bindingResult.hasFieldErrors('lastName')}">
                                        <c:forEach items="${bindingResult.getFieldErrors('lastName')}" var="error">
                                            <div class="errorMessage"
                                                 style="color: red;">${error.getDefaultMessage()}</div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="addressLine1" class="form-label">Address Line 1*</label>
                            <input type="text" class="form-control" id="addressLine1" name="addressLine1"
                                   aria-describedby="addressLine1Help" value="${form.addressLine1}">
                            <c:if test="${bindingResult.hasFieldErrors('addressLine1')}">
                                <c:forEach items="${bindingResult.getFieldErrors('addressLine1')}" var="error">
                                    <div class="errorMessage" style="color: red;">${error.getDefaultMessage()}</div>
                                </c:forEach>
                            </c:if>
                        </div>
                        <div class="mb-3">
                            <label for="addressLine2" class="form-label">Address Line 2 (optional)</label>
                            <input type="text" class="form-control" id="addressLine2" name="addressLine2"
                                   aria-describedby="addressLine2Help" value="${form.addressLine2}">
                            <c:if test="${bindingResult.hasFieldErrors('addressLine2')}">
                                <c:forEach items="${bindingResult.getFieldErrors('addressLine2')}" var="error">
                                    <div class="errorMessage" style="color: red;">${error.getDefaultMessage()}</div>
                                </c:forEach>
                            </c:if>
                        </div>
                        <div class="row">
                            <div class="col-5">
                                <div class="mb-3 me-2">
                                    <label for="city" class="form-label">City*</label>
                                    <input type="text" class="form-control" id="city" name="city"
                                           aria-describedby="cityHelp" value="${form.city}">
                                    <c:if test="${bindingResult.hasFieldErrors('city')}">
                                        <c:forEach items="${bindingResult.getFieldErrors('city')}" var="error">
                                            <div class="errorMessage"
                                                 style="color: red;">${error.getDefaultMessage()}</div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="mb-3 me-2">
                                    <label for="state" class="form-label">State*</label>
                                    <select id="state" name="state" class="form-select" aria-label="select state">
                                        <c:forEach items="${states}" var="state">
                                            <option value="${state}"
                                                    <c:if test="${state eq form.state}">selected</c:if>>${state}</option>
                                        </c:forEach>
                                    </select>
                                    <c:if test="${bindingResult.hasFieldErrors('state')}">
                                        <c:forEach items="${bindingResult.getFieldErrors('state')}" var="error">
                                            <div class="errorMessage"
                                                 style="color: red;">${error.getDefaultMessage()}</div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col">
                                <div class="mb-3">
                                    <label for="zipcode" class="form-label">Zipcode*</label>
                                    <input type="text" class="form-control" id="zipcode" name="zipcode"
                                           aria-describedby="zipcodeHelp" value="${form.zipcode}">
                                    <c:if test="${bindingResult.hasFieldErrors('zipcode')}">
                                        <c:forEach items="${bindingResult.getFieldErrors('zipcode')}" var="error">
                                            <div class="errorMessage"
                                                 style="color: red;">${error.getDefaultMessage()}</div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-check mt-2 mb-3" style="margin-left: 11px">
                                <input class="form-check-input" type="checkbox" id="saveAddress" name="saveAddress"
                                       value="true">
                                <label class="form-check-label" for="saveAddress">
                                    Save as default address for future orders
                                </label>
                            </div>
                        </div>
                        <hr>
                        <div class="row pt-3 mb-4">
                            <div class="col">
                                <h5 class="">Billing</h5>
                            </div>
                            <div class="col d-flex justify-content-end">
                                <img class="me-1" src="/pub/images/icons/payment/visa.svg" style="width: 40px">
                                <img class="me-1" src="/pub/images/icons/payment/master.svg" style="width: 40px">
                                <img class="me-1" src="/pub/images/icons/payment/amex.svg" style="width: 40px">
                                <img class="" src="/pub/images/icons/payment/discover.svg" style="width: 40px">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="mb-3 me-2">
                                    <label for="creditCardNumber" class="form-label">Credit Card Number*</label>
                                    <input type="text" class="form-control" id="creditCardNumber"
                                           name="creditCardNumber"
                                           aria-describedby="creditCardNumberHelp"
                                           value="${form.creditCardNumber}">
                                    <c:if test="${bindingResult.hasFieldErrors('creditCardNumber')}">
                                        <c:forEach items="${bindingResult.getFieldErrors('creditCardNumber')}"
                                                   var="error">
                                            <div class="errorMessage"
                                                 style="color: red;">${error.getDefaultMessage()}</div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="mb-3 me-2">
                                    <label for="expirationDate" class="form-label">Expiration Date*</label>
                                    <input type="text" class="form-control" id="expirationDate" name="expirationDate"
                                           placeholder="MMYY" aria-describedby="expirationDateHelp"
                                           value="${form.expirationDate}">
                                    <c:if test="${bindingResult.hasFieldErrors('expirationDate')}">
                                        <c:forEach items="${bindingResult.getFieldErrors('expirationDate')}"
                                                   var="error">
                                            <div class="errorMessage"
                                                 style="color: red;">${error.getDefaultMessage()}</div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="mb-3">
                                    <label for="securityCode" class="form-label">Security Code*</label>
                                    <input type="text" class="form-control" id="securityCode" name="securityCode"
                                           aria-describedby="securityCodeHelp" value="${form.securityCode}">
                                    <c:if test="${bindingResult.hasFieldErrors('securityCode')}">
                                        <c:forEach items="${bindingResult.getFieldErrors('securityCode')}" var="error">
                                            <div class="errorMessage"
                                                 style="color: red;">${error.getDefaultMessage()}</div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="mb-3 me-3">
                                <label for="creditCardName" class="form-label">Name on card</label>
                                <input type="text" class="form-control" id="creditCardName" name="creditCardName"
                                       aria-describedby="creditCardNameHelp" value="${form.creditCardName}">
                                <c:if test="${bindingResult.hasFieldErrors('creditCardName')}">
                                    <c:forEach items="${bindingResult.getFieldErrors('creditCardName')}" var="error">
                                        <div class="errorMessage" style="color: red;">${error.getDefaultMessage()}</div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                        <div class="row mt-5" style="padding-left: 13px; padding-right: 13px">
                            <button type="submit" class="btn btn-dark">Place Order</button>
                        </div>
                    </form>
                </div>
                <div class="col-1"></div>
                <div class="col-3">
                    <c:if test="${not empty order.getOrderProductList()}">
                        <h3>Order summary</h3>
                        <hr>
                        <div class="row mt-3">
                            <div class="col-7">
                                Subtotal (${totalItems} items)
                            </div>
                            <div class="col text-end">
                                $${orderTotal}
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                Shipping
                            </div>
                            <div class="col text-end">
                                <c:set var="shipping" value="${5}"/>
                                $
                                <fmt:formatNumber type="number" pattern="###.00" value="${shipping}"/>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                Sales Tax
                            </div>
                            <div class="col text-end">
                                <c:set var="tax" value="${orderTotal * 0.06}"/>
                                $
                                <fmt:formatNumber type="number" pattern="###.00" value="${tax}"/>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                Total
                            </div>
                            <div class="col text-end">
                                $
                                <fmt:formatNumber type="number" pattern="###.00"
                                                  value="${orderTotal + shipping + tax}"/>
                            </div>
                        </div>
                        <hr>
                        <a href="/order/cart" style="color:black"><h5 class="pt-2 pb-3">Edit Items</h5></a>
                        <c:forEach items="${order.getOrderProductList()}" var="orderProduct">
                            <div class="row">
                                <div class="col-4">
                                    <a id="cartImageLink" href="/team/${orderProduct.getProduct().getSportsTeam()}/detail/${orderProduct.getProduct().getId()}">
                                        <img class="cartImage" src="${orderProduct.getProduct().getImgUrl()}"
                                             style="width: 100px">
                                    </a>
                                </div>
                                <div class="col-8">
                                    <a id="cartProductLink" href="/team/${orderProduct.getProduct().getSportsTeam()}/detail/${orderProduct.getProduct().getId()}">
                                        <h6>${orderProduct.getProduct().getProductName()}</h6></a>
                                    <h6>Size: ${orderProduct.getSize()}</h6>
                                    <div class="row">
                                        <div class="col">
                                            <h6>Qty: ${orderProduct.getQuantity()}</h6>
                                        </div>
                                        <div class="col d-flex justify-content-end">
                                            <h6>$${orderProduct.getProduct().getPrice()}</h6>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </c:if>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>