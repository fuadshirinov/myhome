<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 19.09.19
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>myHOME</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="myHOME - real estate template project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/styles/bootstrap-4.1.2/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/myhome/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/plugins/OwlCarousel2-2.3.4/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/plugins/OwlCarousel2-2.3.4/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/plugins/OwlCarousel2-2.3.4/animate.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/styles/main_styles.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/styles/responsive.css">
</head>
<body>
<div class="super_container">
    <div class="super_overlay"></div>

    <!-- Header -->

    <header class="header">
        <c:choose>
            <c:when test="${not empty user}">
                <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                <!-- Header Bar -->
                <div class="header_bar d-flex flex-row align-items-center justify-content-start">
                    <div class="header_list">
                        <ul class="d-flex flex-row align-items-center justify-content-start">
                            <li class="d-flex flex-row align-items-center justify-content-start">
                                <a href="/"><span>MyHome</span></a>
                            </li>
                        </ul>
                    </div>
                    <div class="ml-auto d-flex flex-row align-items-center justify-content-start">

                        <div class="log_reg d-flex flex-row align-items-center justify-content-start">
                            <ul class="d-flex flex-row align-items-start justify-content-start">
                                <li><a href="login">${user.name} ${user.surname}</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <jsp:include page="header.jsp"></jsp:include>
            </c:otherwise>
        </c:choose>

    </header>

    <div class="home">
        <!-- Home Slider -->
        <div class="home_slider_container">
            <div class="owl-carousel owl-theme home_slider">
                <!-- Slide -->
                <div class="slide">
                    <div class="background_image" style="background-image:url(${pageContext.servletContext.contextPath}/myhome/images/index.jpg)"></div>
                </div>
            </div>

        </div>
    </div>

    <!-- Search -->

    <div class="search">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="search_container">
                        <div class="search_title">Find your home</div>
                        <div class="search_form_container">
                            <form action="${pageContext.servletContext.contextPath}/basic-search" class="search_form" id="search_form" method="get">
                                <div class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
                                    <div class="search_inputs d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
                                        <select class="search_input" style="padding: 10px" name="type">
                                            <option selected hidden disabled>Elan növü</option>
                                            <option value="0">Satılır</option>
                                            <option value="1">Kirayə verilir</option>
                                        </select>&nbsp;
                                        <select class="search_input" style="padding: 10px" name="estate_type">
                                            <option selected hidden disabled>Əmlak növü</option>
                                            <option disabled>Hamısı</option>
                                            <c:forEach items="${estates}" var="estate">
                                                <option value="${estate.id}">${estate.name}</option>
                                            </c:forEach>
                                        </select>&nbsp;
                                        <select class="search_input" style="padding: 10px" name="condition">
                                            <option selected hidden disabled>Əmlakın vəziyyəti</option>
                                            <option value="0">Yeni</option>
                                            <option value="1">Köhnə</option>
                                        </select>&nbsp;
                                        <button class="search_button">Axtar</button>
                                    </div>
                                </div>
                                <br>
                                <div class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
                                    <div class="search_inputs d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
                                        <select class="search_input" style="width: 14%;font-size: 15px;padding: 5px"
                                                name="room-min">
                                            <option selected hidden value="1">Otaq min</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                        </select>&nbsp;
                                        <select class="search_input" style="width: 14%;font-size: 15px;padding: 5px"
                                                name="room-max">
                                            <option selected hidden disabled>Otaq max</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                        </select>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <select class="search_input" style="width: 14%;font-size: 14px;padding: 3px"
                                                name="price-min">
                                            <option selected hidden disabled value="1">Qiymət min</option>
                                            <option value="100">100</option>
                                            <option value="200">200</option>
                                            <option value="300">300</option>
                                            <option value="400">400</option>
                                            <option value="500">500</option>
                                            <option value="1000">1000</option>
                                            <option value="10000">10000</option>
                                            <option value="50000">50000</option>
                                            <option value="100000">100000</option>
                                            <option value="150000">150000</option>
                                            <option value="200000">200000</option>
                                        </select>&nbsp;
                                        <select class="search_input" style="width: 14%;font-size: 14px;padding: 3px"
                                                name="price-max">
                                            <option selected hidden disabled>Qiymət max</option>
                                            <option value="100">100</option>
                                            <option value="200">200</option>
                                            <option value="300">300</option>
                                            <option value="400">400</option>
                                            <option value="500">500</option>
                                            <option value="1000">1000</option>
                                            <option value="10000">10000</option>
                                            <option value="50000">50000</option>
                                            <option value="100000">100000</option>
                                            <option value="150000">150000</option>
                                            <option value="200000">200000</option>
                                        </select>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="text" class="search_input" name="sq-min" placeholder="Sahə min"
                                               style="width: 14%;font-size: 15px;padding: 10px"/>&nbsp;
                                        <input type="text" class="search_input" name="sq-max" placeholder="Sahə max"
                                               style="width: 14%;font-size: 15px;padding: 10px"/>&nbsp;
                                        <select class="search_input" style="padding: 10px" name="city-id">
                                            <option selected hidden disabled>Şəhər</option>
                                            <c:forEach items="${cities}" var="city">
                                                <option value="${city.id}">${city.name}</option>
                                            </c:forEach>
                                        </select>&nbsp;
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Featured -->

    <div class="featured">
        <div class="container">
            <div class="row featured_row">
                <c:forEach items="${list}" var="adv">
                    <div class="col-lg-4">
                        <div class="listing">
                            <div class="listing_image">

                                <div class="listing_image_container">
                                    <a href="${pageContext.servletContext.contextPath}/adv-detail?id=${adv.id}">
                                        <img src="${pageContext.servletContext.contextPath}/image?advID=${adv.id}" alt="Shekil gorunmur">
                                    </a>
                                </div>
                                </a>
                                <div class="tags d-flex flex-row align-items-start justify-content-start flex-wrap">
                                    <div class="tag tag_house" style="color: white"><a>${adv.estate.name}</a></div>
                                    <div class="tag tag_sale" style="color: white"><a>${adv.type.name}</a></div>
                                </div>
                                <div class="tag_price listing_price">${adv.price} ${adv.currency.name}</div>
                            </div>
                            <div class="listing_content">
                                <div class="prop_location listing_location d-flex flex-row align-items-start justify-content-start">
                                    <img src="${pageContext.servletContext.contextPath}/myhome/images/icon_1.png" alt="">
                                    <a>${adv.city.name} - ${adv.fullAddress}</a>
                                </div>
                                <div class="listing_info">
                                    <ul class="d-flex flex-row align-items-center justify-content-start flex-wrap">
                                        <li class="property_area d-flex flex-row align-items-center justify-content-start">
                                            <img src="${pageContext.servletContext.contextPath}/myhome/images/icon_2.png" alt="">
                                            <span>${adv.square}</span>
                                        </li>
                                        <li class="d-flex flex-row align-items-center justify-content-start">
                                            <img src="${pageContext.servletContext.contextPath}/myhome/images/icon_4.png" alt="">
                                            <span>${adv.room}</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>


            </div>
        </div>
    </div>

</div>

<script src="${pageContext.servletContext.contextPath}/myhome/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/styles/bootstrap-4.1.2/popper.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/styles/bootstrap-4.1.2/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/greensock/TweenMax.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/greensock/TimelineMax.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/greensock/animation.gsap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/OwlCarousel2-2.3.4/owl.carousel.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/easing/easing.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/progressbar/progressbar.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/parallax-js-master/parallax.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/js/custom.js"></script>

</body>
</html>
