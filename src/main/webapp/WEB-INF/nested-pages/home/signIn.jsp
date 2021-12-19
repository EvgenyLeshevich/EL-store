<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="container col-xl-10 col-xxl-8 px-4 py-5">
    <div class="row align-items-center g-lg-5 py-5">
        <div class="col-lg-7 text-center text-lg-start">
            <h1 class="display-4 fw-bold lh-1 mb-3"><spring:message code="app.home.text.signSales"/></h1>
            <p class="col-lg-10 fs-4"><spring:message code="app.home.text.signSalesProd"/></p>
        </div>
        <div class="col-md-10 mx-auto col-lg-5">
            <jsp:include page="/WEB-INF/nested-pages/form/loginForm.jsp"/>
        </div>
    </div>
</div>