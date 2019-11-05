<%--
  Created by IntelliJ IDEA.
  User: fuad
  Date: 14.10.19
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.servletContext.contextPath}/user/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/user/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>
        Elan detallari
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- CSS Files -->
    <link href="${pageContext.servletContext.contextPath}/user/assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="${pageContext.servletContext.contextPath}/user/assets/demo/demo.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/styles/bootstrap-4.1.2/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/myhome/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.servletContext.contextPath}/myhome/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/styles/single.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/myhome/styles/single_responsive.css">
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

                    <!-- Listing -->

                    <div class="listing_container">
                        <div class="container">
                            <div class="row">
                                <div class="col">

                                    <!-- Image -->
                                    <div class="listing_image"><img src="${pageContext.servletContext.contextPath}/user/image?advID=${adv.id}" alt=""></div>

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
                </div>
            </div>
        </div>
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
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Chartist JS -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="${pageContext.servletContext.contextPath}/user/assets/js/material-dashboard.js?v=2.1.1" type="text/javascript"></script>
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
