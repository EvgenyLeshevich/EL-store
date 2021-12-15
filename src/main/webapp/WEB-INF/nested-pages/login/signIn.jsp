<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="col-md-10 mx-auto col-lg-5">
    <h1>Sign in</h1>
<%--    <c:if test="${!message}">--%>
<%--        <div class="alert alert-${messageType}" role="alert">--%>
<%--                ${message}--%>
<%--        </div>--%>
<%--    </c:if>--%>

    <c:choose>
        <c:when test="${message == false}">
            <div class="alert alert-${messageType}" role="alert">
                    ${message}
            </div>
        </c:when>
        <c:when test="${param.error == false}">
            <div class="alert alert-danger" role="alert">
                Invalid username and password.
            </div>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>

    <jsp:include page="/WEB-INF/nested-pages/form/loginForm.jsp"/>
</div>