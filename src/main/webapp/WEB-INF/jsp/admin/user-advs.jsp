<%--
  Created by IntelliJ IDEA.
  User: fuad
  Date: 24.10.19
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Elan detallari</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet"/>
    <!-- PLUGINS STYLES-->
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/DataTables/datatables.min.css" rel="stylesheet"/>
    <!-- THEME STYLES-->
    <link href="${pageContext.servletContext.contextPath}/admin/assets/css/main.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/plugins/OwlCarousel2-2.3.4/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/plugins/OwlCarousel2-2.3.4/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/plugins/OwlCarousel2-2.3.4/animate.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/styles/listings.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/styles/listings_responsive.css">


    <style>
        .listing_image_container {
            height: unset;
        }

        .listing_box {
            width: 30%;
            display: inline-block;
        }
    </style>
</head>
<body class="fixed-navbar">
<div class="page-wrapper">

    <jsp:include page="header.jsp"/>
    <!-- END HEADER-->
    <!-- START SIDEBAR-->
    <jsp:include page="sidebar.jsp"/>
    <!-- END SIDEBAR-->


    <div class="content-wrapper">
        <!-- START PAGE CONTENT-->
        <div class="page-content fade-in-up">
            <div class="col-md-12">
                <div class="super_container">
                    <!-- Listings Container -->
                    <div class="listings_container">

                        <c:forEach items="${list}" var="adv">
                            <a href="${pageContext.servletContext.contextPath}/admin/adv-detail?id=${adv.id}">
                                <div class="listing_box house sale">
                                    <div class="listing">

                                        <div class="listing_image">
                                            <div class="listing_image_container">
                                                <img src="${pageContext.servletContext.contextPath}/admin/image?advID=${adv.id}" alt="">
                                            </div>
                                            <div class="tags d-flex flex-row align-items-start justify-content-start flex-wrap">
                                                <div class="tag tag_house" style="color: white">
                                                    <a>${adv.estate.name}</a>
                                                </div>
                                                <div class="tag tag_sale">
                                                    <a>${adv.type.name}</a>
                                                </div>
                                            </div>
                                            <div class="tag_price listing_price">${adv.price} ${adv.currency.name}</div>
                                        </div>
                                        <div class="listing_content">
                                            <div class="prop_location listing_location d-flex flex-row align-items-start justify-content-start">
                                                <img src="${pageContext.servletContext.contextPath}/myhome/images/icon_1.png" alt="">
                                                <a href="#">${adv.city.name}, ${adv.fullAddress}</a>
                                            </div>
                                            <div class="listing_info">
                                                <ul class="d-flex flex-row align-items-center justify-content-start flex-wrap">
                                                    <li class="property_area d-flex flex-row align-items-center justify-content-start">
                                                        <img src="${pageContext.servletContext.contextPath}/myhome/images/icon_2.png" alt="">
                                                        <span>${adv.square} kv</span>
                                                        <span>kvadrat</span>
                                                    </li>
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="${pageContext.servletContext.contextPath}/myhome/images/icon_4.png" alt="">
                                                        <span>${adv.room}</span>
                                                        <span>otaq</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                        <!-- Listing -->


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- PAGE LEVEL PLUGINS-->
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/chart.js/dist/Chart.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/jvectormap/jquery-jvectormap-2.0.3.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/jvectormap/jquery-jvectormap-us-aea-en.js" type="text/javascript"></script>
<!-- CORE SCRIPTS-->
<script src="${pageContext.servletContext.contextPath}/admin/assets/js/app.min.js" type="text/javascript"></script>
<!-- PAGE LEVEL SCRIPTS-->
<script src="${pageContext.servletContext.contextPath}/admin/assets/js/scripts/dashboard_1_demo.js" type="text/javascript"></script>
</body>
</html>
