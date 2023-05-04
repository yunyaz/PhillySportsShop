<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Philly Sports Shop</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/ab259512ed.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/pub/CSS/style.css">
</head>

<script src="/pub/js/header.js"></script>

<body>
<nav class="navbar navbar-expand-lg border-bottom px-3 py-4">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="/index">Philly Sports Shop</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="navbar-nav">
                <div class="d-inline-flex ps-4">
                    <a class="pt-1" href="/team/eagles"><img src="/pub/images/icons/header/eagles.png"></a>
                    <a id="eagles" class="nav-link header-link" href="/team/eagles" onmouseover="addUnderline('eagles')"
                       onmouseout="removeUnderline('eagles')">Eagles</a>
                </div>
                <div class="d-inline-flex ps-4">
                    <a class="pt-1" href="/team/phillies"><img src="/pub/images/icons/header/phillies.png"></a>
                    <a id="phillies" class="nav-link header-link" href="/team/phillies" onmouseover="addUnderline('phillies')"
                       onmouseout="removeUnderline('phillies')">Phillies</a>
                </div>
                <div class="d-inline-flex ps-4">
                    <a class="" href="/team/76ers"><img src="/pub/images/icons/header/76ers.png"></a>
                    <a id="76ers" class="nav-link header-link" href="/team/76ers" onmouseover="addUnderline('76ers')"
                       onmouseout="removeUnderline('76ers')">76ers</a>
                </div>
                <div class="d-inline-flex ps-4">
                    <a class="pt-2" href="/team/flyers"><img src="/pub/images/icons/header/flyers.png"></a>
                    <a id="flyers" class="nav-link header-link" href="/team/flyers" onmouseover="addUnderline('flyers')"
                       onmouseout="removeUnderline('flyers')">Flyers</a>
                </div>
                <div class="d-inline-flex ps-4">
                    <a class="pt-1" href="/team/union"><img src="/pub/images/icons/header/union.png"></a>
                    <a id="union" class="nav-link header-link" href="/team/union" onmouseover="addUnderline('union')"
                       onmouseout="removeUnderline('union')">Union</a>
                </div>
            </div>
        </div>
        <form action="/search" class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" name="search" aria-label="Search">
            <button class="btn btn-outline-secondary me-5" type="submit">Search</button>
        </form>

        <sec:authorize access="hasAnyAuthority('ADMIN')">
            <div class="dropdown me-2">
                <button id="adminDropdown" class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                    Admin
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/admin/searchProduct">Search Product</a></li>
                    <li><a class="dropdown-item" href="/admin/addProduct">Add Product</a></li>
                </ul>
            </div>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            <a class="nav-link mx-3" href="/account/login">Sign In</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <div class="dropdown me-3">
                <button id="accountDropdown" class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                    Hi <sec:authentication property="principal.username"/>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/account/myAccount">My Account</a></li>
                    <li><a class="dropdown-item" href="/account/myAccount/orderHistory">Order History</a></li>
                    <li><a class="dropdown-item" href="/account/logout">Log out</a></li>
                </ul>
            </div>
        </sec:authorize>
        <a id="cartLink" href="/order/cart" class="cart position-relative d-inline-flex mt-1 ms-2 me-1"
           aria-label="View your shopping cart">
            <i class="fa-solid fa-cart-shopping fa-lg"></i>
            <c:if test="${totalItems > 0}">
                <span class="cart-basket d-flex align-items-center justify-content-center">${totalItems}</span>
            </c:if>
        </a>
    </div>
</nav>
