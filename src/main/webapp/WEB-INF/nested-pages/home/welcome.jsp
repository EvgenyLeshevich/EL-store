<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="container col-xxl-8 px-4 py-5">
    <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
        <div class="col-sm-8 col-lg-6">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="<c:url value="/static/img/carousel/welcome1.jpg" />" class="d-block w-100" alt="...">
                        <div class="carousel-caption  d-md-block">
                            <h5><spring:message code="app.home.text.welcome"/></h5>
                            <%--<p>Some representative placeholder content for the first slide.</p>--%>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="<c:url value="/static/img/carousel/sale1.jpg" />" class="d-block w-100" alt="...">
                        <div class="carousel-caption  d-md-block">
                            <h5><spring:message code="app.home.text.sales"/></h5>
                            <%--<p>Some representative placeholder content for the second slide.</p>--%>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="<c:url value="/static/img/carousel/discussion1.jpg" />" class="d-block w-100" alt="...">
                        <div class="carousel-caption  d-md-block">
                            <h5><spring:message code="app.home.text.desc"/></h5>
                            <%--<p>Some representative placeholder content for the third slide.</p>--%>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <div class="col-lg-6">
            <h1 class="display-5 fw-bold lh-1 mb-3"><spring:message code="app.home.text.elStore"/></h1>
            <p class="lead"><spring:message code="app.home.text.hello"/><br><spring:message code="app.home.text.select"/><br><spring:message code="app.home.text.ask"/><br><spring:message code="app.home.text.bye"/></p>
            <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                <a type="button" class="btn btn-primary btn-lg px-4 me-md-2" href="/catalog"><spring:message code="app.text.catalog"/></a>
                <a type="button" class="btn btn-outline-secondary btn-lg px-4" href="/page-in-development"><spring:message code="app.text.discussions"/></a>
            </div>
        </div>
    </div>
</div>