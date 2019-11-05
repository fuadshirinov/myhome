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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="${pageContext.servletContext.contextPath}/user/assets/demo/demo.css" rel="stylesheet" />
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
                            <h4 class="card-title ">Profili redakte et</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <form:form modelAttribute="form" action="${pageContext.servletContext.contextPath}/user/modify-account">
                                    <ul style="list-style: none">
                                        <li>
                                            <from:input path="name" name="name"/>
                                                <%-- <form:errors path="name"/>--%>
                                            <form:input path="surname" cssStyle="margin-left: 60px"/>
                                                <%--<form:errors path="surname"/>--%>
                                        </li>

                                        <li style="margin-top: 40px">
                                            <form:input path="email"/>
                                                <%--<form:errors path="email"/>--%>
                                            <form:input path="mobile" cssStyle="margin-left: 60px"/>
                                        </li>
                                        <li style="margin-top: 40px">
                                            <input type="submit" class="btn" value="Tesdiq et" style="background-color: green">
                                        </li>
                                    </ul>
                                    <h3 style="margin-top: 100px;color: red;text-align: center">${message}</h3>
                                </form:form>
                            </div>
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
<script src="${pageContext.servletContext.contextPath}/user/js/vendor/modernizr-2.8.3.min.js"></script>
<!-- jquery
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/vendor/jquery-1.12.4.min.js"></script>
<!-- bootstrap JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/bootstrap.min.js"></script>
<!-- wow JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/wow.min.js"></script>
<!-- price-slider JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/jquery-price-slider.js"></script>
<!-- owl.carousel JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/owl.carousel.min.js"></script>
<!-- scrollUp JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/jquery.scrollUp.min.js"></script>
<!-- meanmenu JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/meanmenu/jquery.meanmenu.js"></script>
<!-- counterup JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/counterup/jquery.counterup.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/js/counterup/waypoints.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/js/counterup/counterup-active.js"></script>
<!-- mCustomScrollbar JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- jvectormap JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/js/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/js/jvectormap/jvectormap-active.js"></script>
<!-- sparkline JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/sparkline/jquery.sparkline.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/js/sparkline/sparkline-active.js"></script>
<!-- flot JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/flot/jquery.flot.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/js/flot/jquery.flot.resize.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/js/flot/curvedLines.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/js/flot/flot-active.js"></script>
<!-- knob JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/knob/jquery.knob.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/js/knob/jquery.appear.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/js/knob/knob-active.js"></script>
<!--  wave JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/wave/waves.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/js/wave/wave-active.js"></script>
<!--  Chat JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/chat/moment.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/user/js/chat/jquery.chat.js"></script>
<!--  todo JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/todo/jquery.todo.js"></script>
<!-- plugins JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/plugins.js"></script>
<!-- main JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/main.js"></script>
<!-- tawk chat JS
============================================ -->
<script src="${pageContext.servletContext.contextPath}/user/js/tawk-chat.js"></script>
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
