<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:wrapper title="Sign Up">

    <section id="order-successful" class="order-successful">
        <div class="container">
            <h1 class="error-h1"><spring:message code="app.orderSuccess.text.orderSuccess"/></h1>
            <p class="zoom-area"><spring:message code="app.orderSuccess.text.email"/></p>
            <section class="error-container">
                <span class="main-message"><spring:message code="app.orderSuccess.text.success"/></span>
            </section>
            <div class="link-container">
                <a href="/catalog" class="more-link"><spring:message code="app.orderSuccess.text.goCatalog"/></a>
            </div>
        </div>
    </section>

</t:wrapper>
