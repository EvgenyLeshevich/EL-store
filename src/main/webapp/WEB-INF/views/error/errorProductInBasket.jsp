<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:wrapper title="Sign Up">

    <div class="container">
        <h1 class="error-h1"><spring:message code="app.errorProdInBasket.wrong"/></h1>
        <p class="zoom-area">${errorText} </p>
        <section class="error-container">
            <span>Oops</span>
        </section>
        <div class="link-container">
            <a href="/order" class="more-link"><spring:message code="app.errorProdInBasket.back"/></a>
        </div>
    </div>

</t:wrapper>
