<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- START SIDEBAR-->
<nav class="page-sidebar" id="sidebar">
    <div id="sidebar-collapse">
        <div class="admin-block d-flex">
            <div>
                <img src="${pageContext.servletContext.contextPath}/admin/assets/img/admin-avatar.png" width="45px"/>
            </div>
            <div class="admin-info">
                <div class="font-strong">Fuad Shirinov</div>
                <small>Administrator</small></div>
        </div>
        <ul class="side-menu metismenu">

            <li>
                <a href="javascript:;"><i class="sidebar-item-icon fa fa-building"></i>
                    <span class="nav-label">Elanlar</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                    <li>
                        <a href="${pageContext.servletContext.contextPath}/admin/elanlar?process_status=-1">Hamısı</a>
                    </li>
                    <li>
                        <a href="${pageContext.servletContext.contextPath}/admin/elanlar?process_status=1">Təsdiqlənən</a>
                    </li>
                    <li>
                        <a href="${pageContext.servletContext.contextPath}/admin/elanlar?process_status=0">Gözləyən</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;"><i class="sidebar-item-icon fa ti-user"></i>
                    <span class="nav-label">İstifadəçilər</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                    <li>
                        <a href="${pageContext.servletContext.contextPath}/admin/istifadeciler?status=1">Aktiv</a>
                    </li>
                    <li>
                        <a href="${pageContext.servletContext.contextPath}/admin/istifadeciler?status=0">Silinən</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<!-- END SIDEBAR-->
