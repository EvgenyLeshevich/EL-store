<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:wrapper title="Mobile">

    <section>
        <div class="container">
            <div class="row">
                <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse" style="">
                    <div class="position-sticky pt-3">
                        <div class="accordion" id="accordionExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseOne" aria-expanded="true"
                                            aria-controls="collapseOne">
                                        <spring:message code="app.products.text.filter"/>
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse show"
                                     aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    <ul class="nav flex-column">

                                        <form action="/catalog/mobile/0" method="get">
                                            <c:forEach items="${propValues}" var="property">
                                                <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                                                </h6>
                                                <li>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox"
                                                               name="${property.propertyName}"
                                                               value="${property.propertyValue}">

                                                        <label class="form-check-label">
                                                                ${property.propertyValue}
                                                        </label>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                            <input class="btn btn-warning" style="margin: 5px 15px" type="submit"
                                                   value="Фильтровать">
                                        </form>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>

                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="chartjs-size-monitor">
                        <div class="chartjs-size-monitor-expand">
                            <div class=""></div>
                        </div>
                        <div class="chartjs-size-monitor-shrink">
                            <div class=""></div>
                        </div>
                    </div>
                    <div class="container px-4 py-5" id="custom-cards">
                        <h2 class="pb-2 border-bottom"><spring:message code="app.catalog.text.smartphones"/>:</h2>
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                <spring:message code="app.products.text.sort"/>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <li>
                                    <c:choose>
                                        <c:when test="${param.keySet().contains('name')}">
                                            <a class="dropdown-item"
                                               href="/catalog/mobile/${page}/?sort=price&dir=asc&name=${pageContext.request.getParameter('name')}"><spring:message
                                                    code="app.products.text.cheap"/></a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="dropdown-item" href="/catalog/mobile/${page}/?sort=price&dir=asc"><spring:message
                                                    code="app.products.text.cheap"/></a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li>
                                    <c:choose>
                                        <c:when test="${param.keySet().contains('name')}">
                                            <a class="dropdown-item"
                                               href="/catalog/mobile/${page}/?sort=price&dir=desc&name=${pageContext.request.getParameter('name')}"><spring:message
                                                    code="app.products.text.dear"/></a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="dropdown-item"
                                               href="/catalog/mobile/${page}/?sort=price&dir=desc"><spring:message
                                                    code="app.products.text.dear"/></a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>

                            </ul>
                        </div>

                        <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5"></div>

                        <h1><c:if
                                test="${productsNotFound.equals('productsNotFound')}">Товаров с такими параметрами не найдено!</c:if></h1>

                        <c:forEach items="${products.content}" var="product">

                            <div class="row featurette">
                                <div class="col-md-7 order-md-2">
                                    <h2 class="featurette-heading"><spring:message
                                            code="app.products.text.smart"/> ${product.brand.name} ${product.name} <span
                                            class="text-muted">${product.description}</span>
                                    </h2>
                                    <h1>${product.price}$</h1>
                                    <div class="properties">
                                        <c:forEach items="${product.productProperties}" var="property"
                                                   varStatus="status">
                                            ${property.propertyValue}
                                            <c:if test="${!status.last}">,</c:if>
                                        </c:forEach>
                                    </div>

                                    <c:choose>
                                        <c:when test="${product.count>=10}">
                                            <h5><spring:message code="app.products.text.avail"/>: <span
                                                    class="badge bg-success"><spring:message
                                                    code="app.products.text.many"/></span></h5>
                                        </c:when>
                                        <c:when test="${product.count==1}">
                                            <h5><spring:message code="app.products.text.avail"/>: <span
                                                    class="badge bg-danger"><spring:message
                                                    code="app.products.text.last"/>!</span></h5>
                                        </c:when>
                                        <c:when test="${product.count<10}">
                                            <h5><spring:message code="app.products.text.avail"/>: <span
                                                    class="badge bg-warning"><spring:message
                                                    code="app.products.text.lastOne"/>!</span></h5>
                                        </c:when>
                                    </c:choose>

                                    <iframe name="myIFR" style="display: none"></iframe>
                                    <form target="myIFR" action="/catalog/to_basket" method="post">
                                        <input type="hidden" name="id" value="${product.id}"/>
                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                        <input class="btn btn-success" id="${product.id}" type="submit"
                                               onclick="inBasket(document.getElementById('${product.id}').id)"
                                               value="<spring:message code="app.products.text.inBasket"/>"/>
                                    </form>
                                    <c:forEach items="${listOrderProducts}" var="orderProducts">
                                        <script>
                                            inBasket(${orderProducts.product.id})
                                        </script>
                                    </c:forEach>

                                        <%--<button type="button" class="btn btn-dark">Полная информация</button>
                                        <button type="button" class="btn btn-outline-secondary">Обсудить</button>--%>
                                </div>
                                <div class="col-md-5 order-md-1 my-products-image">
                                    <c:forEach items="${product.productImages}" var="image">
                                        <img style="height: 310px; width: auto;" src="<c:url value="${image.image}" />"
                                             class="card-img-top" alt="${product.name}">
                                    </c:forEach>
                                </div>
                            </div>

                            <hr class="featurette-divider">

                        </c:forEach>

                        <c:if test="${products.totalPages > 1 }">
                            <nav aria-label="Page navigation example">
                                <spring:message code="app.products.text.page"/> ${products.number+1} <spring:message
                                    code="app.products.text.pageOf"/> ${products.totalPages}
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link"
                                           href="/catalog/mobile/${0}/?${requestScope['javax.servlet.forward.query_string']}"
                                           aria-label="Previous">
                                            <span class="sr-only"><spring:message
                                                    code="app.products.text.fistPage"/></span>
                                        </a>
                                    </li>
                                    <c:forEach begin="0" end="${products.totalPages-1}" var="page">
                                        <li class="page-item <c:if test="${page == products.number}"> active </c:if> ">
                                            <a href="/catalog/mobile/${page}/?${requestScope['javax.servlet.forward.query_string']}"
                                               class="page-link">${page+1}</a>
                                        </li>
                                    </c:forEach>
                                    <c:forEach begin="${products.totalPages-1}" end="${products.totalPages-1}"
                                               var="page">
                                        <li class="page-item">
                                            <a class="page-link"
                                               href="/catalog/mobile/${page}/?${requestScope['javax.servlet.forward.query_string']}"
                                               aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only"><spring:message
                                                        code="app.products.text.next"/></span>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </c:if>
                    </div>
                </main>
            </div>
        </div>
    </section>

</t:wrapper>
