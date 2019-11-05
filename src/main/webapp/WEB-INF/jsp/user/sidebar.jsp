<%--
  Created by IntelliJ IDEA.
  User: itcity.academy
  Date: 10/11/2019
  Time: 9:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div class="sidebar-wrapper">
        <ul class="nav">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.servletContext.contextPath}/user/">
                    <i class="material-icons">dashboard</i>
                    <p>Elan yerlesdir</p>
                </a>
            </li>
            <li class="nav-item" style="cursor: pointer">
                <a class="nav-link has-dropdown">
                    <i class="material-icons">home</i>
                    <p>Elanlarim</p>
                </a>

                <ul class="dropdown2">
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/user/adv-datatable?process_status=-1">
                            <i class="material-icons">home</i>
                            <p>Butun elanlarim</p>
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/user/adv-datatable?process_status=1">
                            <i class="material-icons">home</i>
                            <p>Tesdiqlenen elanlarim</p>
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/user/adv-datatable?process_status=0">
                            <i class="material-icons">home</i>
                            <p>Gozleyen elanlarim</p>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item ">
                <a class="nav-link" href="${pageContext.servletContext.contextPath}/user/modify-account">
                    <i class="material-icons">edit</i>
                    <p>Profile duzelis et</p>
                </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="${pageContext.servletContext.contextPath}/user/delete">
                    <i class="material-icons">delete_forever</i>
                    <p>Hesabi sil</p>
                </a>
            </li>
        </ul>
    </div>
</div>