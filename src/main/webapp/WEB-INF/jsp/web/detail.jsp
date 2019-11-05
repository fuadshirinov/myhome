<%--
  Created by IntelliJ IDEA.
  User: fuad
  Date: 19.09.19
  Time: 23:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Detallı</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="myHOME - real estate template project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/styles/bootstrap-4.1.2/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/myhome/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.servletContext.contextPath}/myhome/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/styles/single.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/styles/single_responsive.css">

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="super_container" style="padding-top: 3%">
    <div class="super_overlay"></div>



    <!-- Listing -->

    <div class="listing_container">
        <div class="container">
            <div class="row">
                <div class="col">

                    <!-- Image -->
                    <div class="listing_image"><img src="${pageContext.servletContext.contextPath}/image?advID=${adv.id}" alt=""></div>

                    <div class="about">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="property_info">
                                    <div class="tag_price listing_price">${adv.price}${adv.currency.name}</div>
                                    <div class="listing_name"><h1>${adv.estate.name}</h1></div>
                                    <div class="listing_location d-flex flex-row align-items-start justify-content-start">
                                        <img src="${pageContext.servletContext.contextPath}/myhome/images/icon_1.png" alt="">
                                        <span>${adv.city.name}, ${adv.fullAddress}</span>
                                    </div>
                                    <div class="listing_list">
                                        <ul>
                                            <li>Elan ID-si: ${adv.id}</li>
                                            <li>Yuklenme tarixi: ${adv.idate}</li>
                                        </ul>
                                    </div>
                                    <div class="prop_agent d-flex flex-row align-items-center justify-content-start">
                                        <div class="prop_agent_image"><img src="${pageContext.servletContext.contextPath}/myhome/images/agent_1.jpg" alt=""></div>
                                        <div class="prop_agent_name"><a>${user.name} ${user.surname}</a>&nbsp;&nbsp;&nbsp;${user.mobile}</div>

                                    </div>
                                    <div class="prop_info">
                                        <ul class="d-flex flex-row align-items-center justify-content-start flex-wrap">
                                            <li class="d-flex flex-row align-items-center justify-content-start">
                                                <img src="${pageContext.servletContext.contextPath}/myhome/images/icon_2_large.png" alt="">
                                                <div>
                                                    <div>${adv.square}</div>
                                                    <div>kv</div>
                                                </div>
                                            </li>
                                            <li class="d-flex flex-row align-items-center justify-content-start">
                                                <img src="${pageContext.servletContext.contextPath}/myhome/images/icon_4_large.png" alt="">
                                                <div>
                                                    <div>2</div>
                                                    <div>otaq</div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="listing_features">
                                    <div class="listing_title"><h3>Features</h3></div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <ul>
                                                <li>Wifi</li>
                                                <li>TV</li>
                                                <li>Istilik Sistemi</li>
                                                <li>Kondisioner</li>
                                                <li>Telefon</li>
                                                <li>Kupça</li>
                                            </ul>
                                        </div>
                                        <div class="col-lg-6">
                                            <ul>
                                                <c:choose>
                                                    <c:when test="${adv.wifi}">
                                                        <li>var</li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>yoxdur</li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                <c:when test="${adv.tv}">
                                                    <li>var</li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>yoxdur</li>
                                                </c:otherwise>
                                            </c:choose>
                                                <c:choose>
                                                    <c:when test="${adv.heating}">
                                                        <li>var</li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>yoxdur</li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${adv.conditioner}">
                                                        <li>var</li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>yoxdur</li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${adv.phone}">
                                                        <li>var</li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>yoxdur</li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${adv.document}">
                                                        <li>var</li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>yoxdur</li>
                                                    </c:otherwise>
                                                </c:choose>                                            </ul>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-10">
                                <div class="about_text">
                                    <p>${adv.detail}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->

</div>

<jsp:include page="footer.jsp"></jsp:include>
<script src="${pageContext.servletContext.contextPath}/myhome/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/styles/bootstrap-4.1.2/popper.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/styles/bootstrap-4.1.2/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/greensock/TweenMax.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/greensock/TimelineMax.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/greensock/animation.gsap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/easing/easing.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/progressbar/progressbar.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/parallax-js-master/parallax.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/plugins/colorbox/jquery.colorbox-min.js"></script>
<script src="${pageContext.servletContext.contextPath}/myhome/js/single.js"></script>
</body>
</html>
