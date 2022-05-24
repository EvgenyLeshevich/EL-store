<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:wrapper title="Sign Up">

    <div class="container">
        <h1 class="error-h1"><spring:message code="app.basketInEmpty.emptyProduct"/></h1>
        <section class="error-container">
            <span>0</span>
        </section>
        <div class="link-container">
            <a href="/catalog/mobile/0" class="more-link"><spring:message code="app.basketInEmpty.goCatalog"/></a>
        </div>
    </div>

</t:wrapper>
