<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 17.10.19
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Mesaj gonder</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
    <!-- PLUGINS STYLES-->
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/DataTables/datatables.min.css" rel="stylesheet" />
    <!-- THEME STYLES-->
    <link href="${pageContext.servletContext.contextPath}/admin/assets/css/main.min.css" rel="stylesheet" />
    <!-- PAGE LEVEL STYLES-->
    <style>
        .message{
            border: 2px outset #7926A4;
            border-radius: 5px;
            width: 800px;
            resize: none;
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
            <div style="margin: 10%;margin-left: 25%">
                <form method="post" action="${pageContext.servletContext.contextPath}/admin/send-message">
                    <input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="userID" value="${userID}">
                <ul style="list-style: none">
                    <li>
                        <input class="message" type="text" name="subject" placeholder="Movzu" style="height: 50px" >
                    </li>
                    <li style="margin-top: 3px">
                        <textarea class="message" placeholder="Mesaj...." style="height: 300px" name="content"></textarea>
                    </li>
                    <span>${message}</span>
                    <li>
                        <input class="btn" style="cursor: pointer;background-color: #7926A4;color: white;" type="submit" value="Gonder">
                    </li>
                </ul>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- PAGE LEVEL PLUGINS-->
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/DataTables/datatables.min.js" type="text/javascript"></script>
<!-- CORE SCRIPTS-->
<script src="${pageContext.servletContext.contextPath}/admin/assets/js/app.min.js" type="text/javascript"></script>


</body>
</html>
