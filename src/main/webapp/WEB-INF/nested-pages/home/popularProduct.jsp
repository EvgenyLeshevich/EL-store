<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container px-4 py-5" id="custom-cards">
    <h2 class="pb-2 border-bottom"><spring:message code="app.home.text.popularProd"/>:</h2>
    <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
        <c:forEach items="${popularProducts}" var="prod">
            <div class="col">
                <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg"
                     style="background-image: url('unsplash-photo-1.jpg');">
                    <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                        <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">${prod.name}</h2>
                        <ul class="d-flex list-unstyled mt-auto">
                            <li class="d-flex align-items-center me-3">
                                <small>Category: ${prod.category.name}</small>
                            </li>
                            <li class="d-flex align-items-center">
                                <small>Price: ${prod.price}$</small>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>