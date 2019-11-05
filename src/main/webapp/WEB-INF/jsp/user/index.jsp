<!--
=========================================================
Material Dashboard - v2.1.1
=========================================================

Product Page: https://www.creative-tim.com/product/material-dashboard
Copyright 2019 Creative Tim (https://www.creative-tim.com)
Licensed under MIT (https://github.com/creativetimofficial/material-dashboard/blob/master/LICENSE.md)

Coded by Creative Tim

=========================================================

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.servletContext.contextPath}/user/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/user/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>
        User sehifesi
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- CSS Files -->
    <link href="${pageContext.servletContext.contextPath}/user/assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
    <style>
        .adv-form{
            display: inline-block;
            width: 200px;
            padding-left: 50px ;

        }
        .adv-select{
            width: 100%;
            height: 50px;
            text-align: center;
        }
        .adv-option{
            text-align: center;
        }

    </style>
</head>

<body class="">
<div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="white" data-image="../assets/img/sidebar-1.jpg">
        <!--
          Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

          Tip 2: you can also add an image using data-image tag
      -->
        <div class="logo">
            <a class="simple-text logo-normal">
                MyHome
            </a>
        </div>
        <jsp:include page="sidebar.jsp"></jsp:include>
    </div>
    <div class="main-panel">
        <jsp:include page="navbar.jsp"></jsp:include>
        <div class="content">
            <div class="container-fluid">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header card-header-primary">
                            <h4 class="card-title ">Elan yerlesdir</h4>
                        </div>
                        <div class="card-body">
                            <form method="post" action="${pageContext.servletContext.contextPath}/user/add" enctype="multipart/form-data">

                                <!-- File upload ederken asagidaki hidden inputu daxil etmek vacibdir(eks teqdirde security error verecek) -->
                                <input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                <div class="row" style="padding-left: 100px;padding-right: 100px">
                                    <ul>
                                        <li class="adv-form" style="text-align: center">
                                            <label for="type">Elan novu</label><br>
                                            <select id="type" name="type" class="adv-select">
                                                <option value="-1">Secin</option>
                                                <option value="0">Satılır</option>
                                                <option value="1">Kirayə</option>
                                            </select>
                                            <c:if test="${not empty errors.advType}">
                                                <c:forEach items="${errors.advType}" var="error">
                                                    ${error}<br/>
                                                </c:forEach>
                                            </c:if>
                                        </li>
                                        <li class="adv-form" style="text-align: center">
                                            <label for="estate">Əmlak novu</label><br>
                                            <select id="estate" name="estate" class="adv-select">
                                                <option value="-1">Secin</option>
                                                <c:forEach items="${estates}" var="estate">
                                                    <option value="${estate.id}">${estate.name}</option>
                                                </c:forEach>
                                            </select>
                                            <c:if test="${not empty errors.estateType}">
                                                <c:forEach items="${errors.estateType}" var="error">
                                                    ${error}<br/>
                                                </c:forEach>
                                            </c:if>
                                        </li>
                                        <li class="adv-form" style="text-align: center">
                                            <label for="document">Kupca</label><br>
                                            <select id="document" name="document" class="adv-select">
                                                <option value="-1">Secin</option>
                                                <option value="false" class="adv-option">yoxdur</option>
                                                <option value="true" class="adv-option">var</option>
                                            </select>
                                            <c:if test="${not empty errors.document}">
                                                <c:forEach items="${errors.document}" var="error">
                                                    ${error}<br/>
                                                </c:forEach>
                                            </c:if>
                                        </li>
                                        <li class="adv-form" style="text-align: center">
                                            <label for="condition">Vəziyyət</label><br>
                                            <select id="condition" name="condition" class="adv-select">
                                                <option value="-1">Secin</option>
                                                <option value="0" class="adv-option">yeni</option>
                                                <option value="1" class="adv-option">kohne</option>
                                            </select>
                                            <c:if test="${not empty errors.condition}">
                                                <c:forEach items="${errors.condition}" var="error">
                                                    ${error}<br/>
                                                </c:forEach>
                                            </c:if>
                                        </li>
                                    </ul>
                                </div>
                                <div class="row" style="padding-left: 100px;padding-right: 100px;padding-top: 30px">
                                    <ul>
                                        <li class="adv-form" style="text-align: center">
                                            <label for="city">Şəhər</label><br>
                                            <select id="city" name="city" class="adv-select">
                                                <option value="-1">Secin</option>
                                                <c:forEach items="${cities}" var="city">
                                                    <option value="${city.id}">${city.name}</option>
                                                </c:forEach>
                                            </select>
                                            <c:if test="${not empty errors.city}">
                                                <c:forEach items="${errors.city}" var="error">
                                                    ${error}<br/>
                                                </c:forEach>
                                            </c:if>
                                        </li>
                                        <li class="adv-form" style="text-align: center;width: 400px">
                                            <label for="address">Tam adress</label><br>
                                            <input id="address" name="fullAddress" class="adv-select" style="width: 100%"/>
                                            <c:if test="${not empty errors.address}">
                                                <c:forEach items="${errors.address}" var="error">
                                                    ${error}<br/>
                                                </c:forEach>
                                            </c:if>
                                        </li>
                                    </ul>
                                </div>
                                <div class="row" style="padding-left: 100px;padding-right: 100px;padding-top: 30px">
                                    <ul>
                                        <li class="adv-form" style="text-align: center;width: 260px">
                                            <label for="room">Otaq sayı</label><br>
                                            <input id="room" type="text" name="room" class="adv-select" style="width: 100%"/>
                                            <c:if test="${not empty errors.room}">
                                                <c:forEach items="${errors.room}" var="error">
                                                    ${error}<br/>
                                                </c:forEach>
                                            </c:if>
                                        </li>
                                        <li class="adv-form" style="text-align: center;width: 260px">
                                            <label for="square">Kvadrat</label><br>
                                            <input id="square" type="text" name="square" class="adv-select" style="width: 100%"/>
                                            <c:if test="${not empty errors.square}">
                                                <c:forEach items="${errors.square}" var="error">
                                                    ${error}<br/>
                                                </c:forEach>
                                            </c:if>
                                        </li>
                                        <li class="adv-form" style="text-align: center;width: 260px">
                                            <label for="floor">Mərtəbə</label><br>
                                            <input id="floor" type="text" name="floor" class="adv-select" style="width: 100%"/>
                                            <c:if test="${not empty errors.floor}">
                                                <c:forEach items="${errors.floor}" var="error">
                                                    ${error}<br/>
                                                </c:forEach>
                                            </c:if>
                                        </li>
                                    </ul>
                                </div>
                                <div class="row" style="padding-left: 100px;padding-right: 100px;padding-top: 30px  ">
                                    <ul>
                                        <li class="adv-form" style="text-align: center;width: 152px">
                                            <label for="wifi">WIFI</label><br>
                                            <select id="wifi" name="wifi" class="adv-select">
                                                <option value="-1" class="adv-option">Secin</option>
                                                <option value="false" class="adv-option">yoxdur</option>
                                                <option value="true" class="adv-option">var</option>
                                            </select>
                                            <c:if test="${not empty errors.wifi}">
                                                <c:forEach items="${errors.wifi}" var="error">
                                                    ${error}<br/>
                                                </c:forEach>
                                            </c:if>
                                        </li>
                                        </li>
                                        <li class="adv-form" style="text-align: center;width: 152px">
                                            <label for="tv">TV</label><br>
                                            <select id="tv" name="tv" class="adv-select">
                                                <option value="-1" class="adv-option">Secin</option>
                                                <option value="false" class="adv-option">yoxdur</option>
                                                <option value="true" class="adv-option">var</option>
                                            </select>
                                            <c:if test="${not empty errors.tv}">
                                                <c:forEach items="${errors.tv}" var="error">
                                                    ${error}<br/>
                                                </c:forEach>
                                            </c:if>
                                        </li>
                                        <li class="adv-form" style="text-align: center;width: 152px">
                                            <label for="phone">Telefon</label><br>
                                            <select id="phone" name="phone" class="adv-select" >
                                                <option value="-1" class="adv-option">Secin</option>
                                                <option value="false" class="adv-option">yoxdur</option>
                                                <option value="true" class="adv-option">var</option>
                                            </select>
                                            <c:if test="${not empty errors.phone}">
                                                <c:forEach items="${errors.phone}" var="error">
                                                    ${error}<br/>
                                                </c:forEach>
                                            </c:if>
                                        </li>
                                        <li class="adv-form" style="text-align: center;width: 152px">
                                            <label for="conditioner">Kondisioner</label><br>
                                            <select id="conditioner" name="conditioner" class="adv-select">
                                                <option value="-1" class="adv-option">Secin</option>
                                                <option value="false" class="adv-option">yoxdur</option>
                                                <option value="true" class="adv-option">var</option>
                                            </select>
                                            <c:if test="${not empty errors.conditioner}">
                                                <c:forEach items="${errors.conditioner}" var="error">
                                                    ${error}<br/>
                                                </c:forEach>
                                            </c:if>
                                        </li>
                                        <li class="adv-form" style="text-align: center;width: 152px">
                                            <label for="heating">Istilik sistemi</label><br>
                                            <select id="heating" name="heating"  class="adv-select">
                                                <option value="-1" class="adv-option">Secin</option>
                                                <option value="false" class="adv-option">yoxdur</option>
                                                <option value="true" class="adv-option">var</option>
                                            </select>
                                            <c:if test="${not empty errors.heating}">
                                                <c:forEach items="${errors.heating}" var="error">
                                                    ${error}<br/>
                                                </c:forEach>
                                            </c:if>
                                        </li>
                                    </ul>
                                </div>
                                <div class="row" style="padding-left: 100px;padding-right: 100px;padding-top: 30px  ">
                                    <label for="detail">Əlavə məlumat</label></br>
                                    <input id="detail" name="detail" style="width: 800px"/>
                                    <c:if test="${not empty errors.detail}">
                                        <c:forEach items="${errors.detail}" var="error">
                                            ${error}<br/>
                                        </c:forEach>
                                    </c:if>
                                </div>
                                <div class="row" style="padding-left: 100px;padding-right: 100px;padding-top: 30px  ">
                                    <ul>

                                        <li class="adv-form"  style="text-align: center;width: 152px;display: inline-block" >
                                            <label for="media">Şəkil</label><br>
                                            <input type="file" id="media" name="file">
                                        </li>

                                        <li style="display: inline-block;padding-left: 500px">
                                            <input type="text" name="price">
                                            <select name="currency">
                                                <c:forEach items="${currencies}" var="currency">
                                                    <option value="${currency.id}">${currency.name}</option>
                                                </c:forEach>
                                            </select>
                                        </li>
                                    </ul>
                                </div>
                                <div class="row" style="padding-left: 100px;padding-right: 100px;padding-top: 30px  ">
                                    <ul>
                                        <li class="adv-form"  style="text-align: center;width: 152px">
                                            <input type="submit" value="Tesdiqle">
                                        </li>
                                    </ul>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container-fluid">
                <nav class="float-left">
                    <ul>
                        <li>
                            <a href="https://www.creative-tim.com">
                                Creative Tim
                            </a>
                        </li>
                        <li>
                            <a href="https://creative-tim.com/presentation">
                                About Us
                            </a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com">
                                Blog
                            </a>
                        </li>
                        <li>
                            <a href="https://www.creative-tim.com/license">
                                Licenses
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="copyright float-right">
                    &copy;
                    <script>
                        document.write(new Date().getFullYear())
                    </script>, made with <i class="material-icons">favorite</i> by
                    <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a> for a better web.
                </div>
            </div>
        </footer>
    </div>
</div>
<!--   Core JS Files   -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/core/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/assets/js/core/popper.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/assets/js/core/bootstrap-material-design.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!-- Plugin for the momentJs  -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/moment.min.js"></script>
<!--  Plugin for Sweet Alert -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/sweetalert2.js"></script>
<!-- Forms Validations Plugin -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/jquery.validate.min.js"></script>
<!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/jquery.bootstrap-wizard.js"></script>
<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/bootstrap-selectpicker.js"></script>
<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
<!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/jquery.dataTables.min.js"></script>
<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/bootstrap-tagsinput.js"></script>
<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/fullcalendar.min.js"></script>
<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/jquery-jvectormap.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/nouislider.min.js"></script>
<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
<script src="${pageContext.servletContext.contextPath}/user/https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<!-- Library for adding dinamically elements -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/arrive.min.js"></script>
<!--  Google Maps Plugin    -->
<!-- Chartist JS -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/material-dashboard.js?v=2.1.1" type="text/javascript"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.servletContext.contextPath}/user/assets/demo/demo.js"></script>
<script>
    $(document).ready(function() {
        $().ready(function() {
            $sidebar = $('.sidebar');

            $sidebar_img_container = $sidebar.find('.sidebar-background');

            $full_page = $('.full-page');

            $sidebar_responsive = $('body > .navbar-collapse');

            window_width = $(window).width();

            fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

            if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
                if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
                    $('.fixed-plugin .dropdown').addClass('open');
                }

            }

            $('.fixed-plugin a').click(function(event) {
                // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
                if ($(this).hasClass('switch-trigger')) {
                    if (event.stopPropagation) {
                        event.stopPropagation();
                    } else if (window.event) {
                        window.event.cancelBubble = true;
                    }
                }
            });

            $('.fixed-plugin .active-color span').click(function() {
                $full_page_background = $('.full-page-background');

                $(this).siblings().removeClass('active');
                $(this).addClass('active');

                var new_color = $(this).data('color');

                if ($sidebar.length != 0) {
                    $sidebar.attr('data-color', new_color);
                }

                if ($full_page.length != 0) {
                    $full_page.attr('filter-color', new_color);
                }

                if ($sidebar_responsive.length != 0) {
                    $sidebar_responsive.attr('data-color', new_color);
                }
            });

            $('.fixed-plugin .background-color .badge').click(function() {
                $(this).siblings().removeClass('active');
                $(this).addClass('active');

                var new_color = $(this).data('background-color');

                if ($sidebar.length != 0) {
                    $sidebar.attr('data-background-color', new_color);
                }
            });

            $('.fixed-plugin .img-holder').click(function() {
                $full_page_background = $('.full-page-background');

                $(this).parent('li').siblings().removeClass('active');
                $(this).parent('li').addClass('active');


                var new_image = $(this).find("img").attr('src');

                if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                    $sidebar_img_container.fadeOut('fast', function() {
                        $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                        $sidebar_img_container.fadeIn('fast');
                    });
                }

                if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                    var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                    $full_page_background.fadeOut('fast', function() {
                        $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                        $full_page_background.fadeIn('fast');
                    });
                }

                if ($('.switch-sidebar-image input:checked').length == 0) {
                    var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
                    var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                    $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                    $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                }

                if ($sidebar_responsive.length != 0) {
                    $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
                }
            });

            $('.switch-sidebar-image input').change(function() {
                $full_page_background = $('.full-page-background');

                $input = $(this);

                if ($input.is(':checked')) {
                    if ($sidebar_img_container.length != 0) {
                        $sidebar_img_container.fadeIn('fast');
                        $sidebar.attr('data-image', '#');
                    }

                    if ($full_page_background.length != 0) {
                        $full_page_background.fadeIn('fast');
                        $full_page.attr('data-image', '#');
                    }

                    background_image = true;
                } else {
                    if ($sidebar_img_container.length != 0) {
                        $sidebar.removeAttr('data-image');
                        $sidebar_img_container.fadeOut('fast');
                    }

                    if ($full_page_background.length != 0) {
                        $full_page.removeAttr('data-image', '#');
                        $full_page_background.fadeOut('fast');
                    }

                    background_image = false;
                }
            });

            $('.switch-sidebar-mini input').change(function() {
                $body = $('body');

                $input = $(this);

                if (md.misc.sidebar_mini_active == true) {
                    $('body').removeClass('sidebar-mini');
                    md.misc.sidebar_mini_active = false;

                    $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

                } else {

                    $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

                    setTimeout(function() {
                        $('body').addClass('sidebar-mini');

                        md.misc.sidebar_mini_active = true;
                    }, 300);
                }

                // we simulate the window Resize so the charts will get updated in realtime.
                var simulateWindowResize = setInterval(function() {
                    window.dispatchEvent(new Event('resize'));
                }, 180);

                // we stop the simulation of Window Resize after the animations are completed
                setTimeout(function() {
                    clearInterval(simulateWindowResize);
                }, 1000);

            });
        });
    });
</script>
<script>
    $(document).ready(function() {
        // Javascript method's body can be found in assets/js/demos.js
        md.initDashboardPageCharts();

    });
</script>
</body>

</html>
