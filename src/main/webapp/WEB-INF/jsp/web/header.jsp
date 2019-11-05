<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 19.09.19
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Header Bar -->
<div class="header_bar d-flex flex-row align-items-center justify-content-start">
    <div class="header_list">
        <ul class="d-flex flex-row align-items-center justify-content-start">
            <li class="d-flex flex-row align-items-center justify-content-start">
                <a href="${pageContext.servletContext.contextPath}/"><span>MyHome</span></a>
            </li>
        </ul>
    </div>
    <div class="ml-auto d-flex flex-row align-items-center justify-content-start">

        <div class="log_reg d-flex flex-row align-items-center justify-content-start">
            <div>
                <a href="${pageContext.servletContext.contextPath}/user"><h3 style="color:snow;background-color: #0f9d58;margin-right: 50px;padding: 5px;">Elan yerləşdir</h3></a>
            </div>
            <ul class="d-flex flex-row align-items-start justify-content-start">
                <li><a href="${pageContext.servletContext.contextPath}/login">Login</a></li>
                <li><a href="${pageContext.servletContext.contextPath}/register">Register</a></li>
            </ul>
        </div>
    </div>
</div>
