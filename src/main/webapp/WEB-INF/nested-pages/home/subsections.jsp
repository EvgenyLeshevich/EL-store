<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="container col-xxl-8 px-4 py-5">
    <div class="row align-items-md-stretch">
        <div class="col-md-6">
            <div class="h-100 p-5 text-white bg-dark rounded-3">
                <h2><spring:message code="app.text.catalog"/></h2>
                <p><spring:message code="app.home.text.catalogMess"/></p>
                <a type="button" class="btn btn-outline-light" href="/catalog/mobile/0"><spring:message code="app.home.text.goShop"/></a>
            </div>
        </div>
        <div class="col-md-6">
            <div class="h-100 p-5 bg-light border rounded-3">
                <h2><spring:message code="app.text.discussions"/></h2>
                <p><spring:message code="app.home.text.discusMess"/> </p>
                <a type="button" class="btn btn-outline-secondary" href="/page-in-development"><spring:message code="app.home.text.goDiscuss"/></a>
            </div>
        </div>
    </div>
</div>