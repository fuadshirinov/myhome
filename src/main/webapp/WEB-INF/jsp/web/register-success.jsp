<%--
  Created by IntelliJ IDEA.
  User: fuad
  Date: 28.09.19
  Time: 01:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Activated</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/login/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/login/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/login/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/login/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/login/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/login/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/login/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/login/css/util.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/login/css/main.css">
    <!--===============================================================================================-->
</head>
<body>


<div class="super_container">
    <div class="super_overlay"></div>

    <div class="limiter">
        <div class="container-${pageContext.servletContext.contextPath}/login100">
            <div class="wrap-${pageContext.servletContext.contextPath}/login100 p-t-50 p-b-90">
                <form class="${pageContext.servletContext.contextPath}/login100-form validate-form flex-sb flex-w">
					<span class="${pageContext.servletContext.contextPath}/login100-form-title p-b-51">
						E-mail hesabınıza sorğu göndərildi,hesabınızı aktivləşdirmək üçün mailinizdəki linkə klik edin!
					</span>
                </form>
            </div>
        </div>
    </div>


    <div id="dropDownSelect1"></div>
    <header class="header">
        <jsp:include page="header.jsp"></jsp:include>
    </header>



    <jsp:include page="footer.jsp"></jsp:include>
</div>

<!--===============================================================================================-->
<script src="${pageContext.servletContext.contextPath}/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.servletContext.contextPath}/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.servletContext.contextPath}/login/vendor/bootstrap/js/popper.js"></script>
<script src="${pageContext.servletContext.contextPath}/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.servletContext.contextPath}/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.servletContext.contextPath}/login/vendor/daterangepicker/moment.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.servletContext.contextPath}/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.servletContext.contextPath}/login/js/main.js"></script>
</body>
</html>
