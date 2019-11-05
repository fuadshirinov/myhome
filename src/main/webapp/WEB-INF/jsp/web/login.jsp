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
    <title>Daxil ol</title>
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
        <div class="container-login100">
            <div class="wrap-login100 p-t-50 p-b-90">
                <form class="login100-form validate-form flex-sb flex-w" action="${pageContext.servletContext.contextPath}/login" method="post">
					<span class="login100-form-title p-b-51">
						Daxil ol
					</span>
                    <div class="wrap-input100 validate-input m-b-16" data-validate="Email məcburidir">
                        <input class="input100" name="username" placeholder="Email"/>
                        <span class="focus-input100"></span>
                    </div>
                    <div class="wrap-input100 validate-input m-b-16" data-validate="Parol məcburidir">
                        <input type="password" class="input100" name="password" placeholder="Parol"/>
                        <span class="focus-input100"></span>
                    </div>
                    <c:if test="${param.error!=null}">
                        Email veya parol yanlisdir
                    </c:if>
                    <c:if test="${param.logout != null}">       3
                        <p>
                            You have been logged out.
                        </p>
                    </c:if>
                    <input type="hidden"
                           name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <div class="flex-sb-m w-full p-t-3 p-b-24">
                        <div class="contact100-form-checkbox">
                            <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                            <label class="label-checkbox100" for="ckb1">
                                Remember me
                            </label>
                        </div>
                    </div>
                    <div class="container-login100-form-btn m-t-17">
                        <button class="login100-form-btn">
                            Daxil ol
                        </button>
                    </div>

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
<%--<script src="${pageContext.servletContext.contextPath}/login/js/main.js"></script>--%>
</body>
</html>
