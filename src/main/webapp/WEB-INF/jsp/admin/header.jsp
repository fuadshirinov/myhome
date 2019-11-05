<%--
  Created by IntelliJ IDEA.
  User: fuad
  Date: 17.10.19
  Time: 01:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="header">
    <div class="page-brand">
        <a class="link" href="${pageContext.servletContext.contextPath}/admin/">
                    <span class="brand">My
                        <span class="brand-tip">Home</span>
                    </span>
        </a>
    </div>
    <div class="flexbox flex-1">
        <!-- START TOP-LEFT TOOLBAR-->
        <ul class="nav navbar-toolbar">
            <li>
                <a class="nav-link sidebar-toggler js-sidebar-toggler"><i class="ti-menu"></i></a>
            </li>

        </ul>
        <!-- END TOP-LEFT TOOLBAR-->
        <!-- START TOP-RIGHT TOOLBAR-->
        <ul class="nav navbar-toolbar">
            <li class="dropdown dropdown-user">
                <a class="nav-link dropdown-toggle link" data-toggle="dropdown">
                    <img src="${pageContext.servletContext.contextPath}/admin/assets/img/admin-avatar.png" />
                    <span></span>${user.name}<i class="fa fa-angle-down m-l-5"></i></a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <form action="${pageContext.servletContext.contextPath}/logout" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input class="dropdown-item" style="cursor: pointer" type="submit" value="Hesabdan cix">
                    </form>
                </ul>
            </li>
        </ul>
        <!-- END TOP-RIGHT TOOLBAR-->
    </div>
</header>