<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>--%>
<header class="page-header">
    <nav class="navbar navbar-expand-lg justify-content-between">
        <a href="#" class="navbar-brand main-logo main-logo-smaller">
            Park<span>.ME</span>
        </a>
<%--        <div class="d-flex justify-content-around">--%>
<%--            <sec:authorize access="isAuthenticated()">--%>
<%--            <p>Zalogowany jako: <sec:authentication property="principal.username"/></p>--%>
<%--        </div>--%>
<%--        <div><sec:authorize access="isAuthenticated()">--%>
<%--            <form action="<c:url value="/logout"/>" method="post">--%>
<%--                <input type="submit" value="Wyloguj">--%>
<%--                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
<%--            </form>--%>
<%--        </sec:authorize>--%>
<%--        </div>--%>
    </nav>
</header>