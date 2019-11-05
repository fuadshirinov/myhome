<%--
  Created by IntelliJ IDEA.
  User: fuad
  Date: 17.10.19
  Time: 02:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Admincast bootstrap 4 &amp; angular 5 admin template, Шаблон админки | Dashboard</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
    <!-- PLUGINS STYLES-->
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/jvectormap/jquery-jvectormap-2.0.3.css" rel="stylesheet" />
    <!-- THEME STYLES-->
    <link href="${pageContext.servletContext.contextPath}/admin/assets/css/main.min.css" rel="stylesheet" />
    <!-- PAGE LEVEL STYLES-->
</head>

<body class="fixed-navbar">
<div class="page-wrapper">
    <!-- START HEADER-->
    <jsp:include page="header.jsp"/>
    <!-- END HEADER-->
    <!-- START SIDEBAR-->
    <jsp:include page="sidebar.jsp"/>
    <!-- END SIDEBAR-->
    <div class="content-wrapper">
        <!-- START PAGE CONTENT-->
        <div class="page-content fade-in-up">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="ibox bg-success color-white widget-stat">
                        <div class="ibox-body">
                            <h2 class="m-b-5 font-strong">${allAdvCount}</h2>
                            <div class="m-b-5">Bütün elanlar</div><i class="ti-shopping-cart widget-stat-icon"></i>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="ibox bg-info color-white widget-stat">
                        <div class="ibox-body">
                            <h2 class="m-b-5 font-strong">${pendingAdvCount}</h2>
                            <div class="m-b-5">Təsdiq gözləyən elanlar</div><i class="ti-bar-chart widget-stat-icon"></i>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="ibox bg-danger color-white widget-stat">
                        <div class="ibox-body">
                            <h2 class="m-b-5 font-strong">${usersCount}</h2>
                            <div class="m-b-5">İstifadəçilər</div><i class="ti-user widget-stat-icon"></i>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- END PAGE CONTENT-->
        <footer class="page-footer">
            <div class="font-13">2018 © <b>AdminCAST</b> - All rights reserved.</div>
            <a class="px-4" href="http://themeforest.net/item/adminca-responsive-bootstrap-4-3-angular-4-admin-dashboard-template/20912589" target="_blank">BUY PREMIUM</a>
            <div class="to-top"><i class="fa fa-angle-double-up"></i></div>
        </footer>
    </div>
</div>

<!-- BEGIN PAGA BACKDROPS-->
<div class="sidenav-backdrop backdrop"></div>
<div class="preloader-backdrop">
    <div class="page-preloader">Loading</div>
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
