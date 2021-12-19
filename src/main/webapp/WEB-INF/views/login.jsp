<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:wrapper title="Sign In">

    <section id="login" class="login">
        <div class="col-md-10 mx-auto col-lg-5">
            <h1><spring:message code="app.text.signIn"/></h1>

            <c:choose>
                <c:when test="${message == false}">
                    <div class="alert alert-${messageType}" role="alert">
                            ${message}
                    </div>
                </c:when>
                <c:when test="${param.error == false}">
                    <div class="alert alert-danger" role="alert">
                        <spring:message code="app.login.text.invalid"/>
                    </div>
                </c:when>
                <c:otherwise>
                </c:otherwise>
            </c:choose>

            <jsp:include page="/WEB-INF/nested-pages/form/loginForm.jsp"/>
        </div>
    </section>

</t:wrapper>