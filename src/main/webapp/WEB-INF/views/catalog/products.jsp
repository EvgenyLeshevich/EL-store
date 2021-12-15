<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:wrapper title="Sign In">

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
                                        Фильтры
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse show"
                                     aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    <ul class="nav flex-column">
                                        В разработке
                                        <%--<c:forEach items="${properties}" var="property">
                                            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                                                <span>${property.propertyName}</span>
                                            </h6>
                                            <c:forEach items="${property.productProperties}" var="productProperties">
                                                <li class="nav-item">
                                                    <div class="form-check">
                                                        <form action="/catalog/mobile" method="post">
                                                            <input class="form-check-input" type="submit"
                                                                   name="propertyValue"
                                                                   value="${productProperties.propertyValue}">
                                                        </form>
                                                        <label class="form-check-label">
                                                                ${productProperties.propertyValue}
                                                        </label>
                                                    </div>
                                                </li>
                                            </c:forEach>

                                        </c:forEach>--%>

                                            <%--<h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                                                <span>Экран</span>
                                            </h6>
                                            <li class="nav-item">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value=""
                                                           id="flexCheckDefault">
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        AMOLED
                                                    </label>
                                                </div>
                                            </li>
                                            <li class="nav-item">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value=""
                                                           id="flexCheckDefault">
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        IPS
                                                    </label>
                                                </div>
                                            </li>--%>
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
                        <h2 class="pb-2 border-bottom">Смартфоны:</h2>
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                Фильтры
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <li>
                                    <c:choose>
                                        <c:when test="${param.keySet().contains('name')}">
                                            <a class="dropdown-item" href="/catalog/mobile/${page}/?sort=price&dir=asc&name=${pageContext.request.getParameter('name')}">Дешевые</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="dropdown-item" href="/catalog/mobile/${page}/?sort=price&dir=asc">Дешевые</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li>
                                    <c:choose>
                                        <c:when test="${param.keySet().contains('name')}">
                                            <a class="dropdown-item" href="/catalog/mobile/${page}/?sort=price&dir=desc&name=${pageContext.request.getParameter('name')}">Дорогие</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="dropdown-item" href="/catalog/mobile/${page}/?sort=price&dir=desc">Дорогие</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </div>

                        <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5"></div>

                        <c:forEach items="${products.content}" var="product">

                            <div class="row featurette">
                                <div class="col-md-7 order-md-2">
                                    <h2 class="featurette-heading">Смартфон ${product.brand.name} ${product.name} <span
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
                                            <h5>Наличие: <span class="badge bg-success">Ещё много!</span></h5>
                                        </c:when>
                                        <c:when test="${product.count==1}">
                                            <h5>Наличие: <span class="badge bg-danger">Последний!</span></h5>
                                        </c:when>
                                        <c:when test="${product.count<10}">
                                            <h5>Наличие: <span class="badge bg-warning">Последние единицы!</span></h5>
                                        </c:when>
                                    </c:choose>


                                        <%--<p class="lead"> Apple iOS, экран 6.1" IPS (828x1792), Apple A13 Bionic, ОЗУ 4 ГБ,
                                            флэш-память 64 ГБ, камера 12 Мп, аккумулятор 3046 мАч, 1 SIM</p>--%>

                                        <%--                                    ЧТО У МЕНЯ БЫЛО!!!!!!!!!!!!!!!!!!!!!!!--%>
                                    <iframe name="myIFR" style="display: none"></iframe>
                                    <form target="myIFR" action="/catalog/to_basket" method="post">
                                            <%--                                    <button type="button" name="${product.id}" class="btn btn-success">В корзину</button>--%>
                                        <input type="hidden" name="id" value="${product.id}"/>
                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                        <input class="btn btn-success" id="${product.id}" type="submit"
                                               onclick="inBasket(document.getElementById('${product.id}').id)"
                                               value="В корзину"/>
                                    </form>
                                    <c:forEach items="${listOrderProducts}" var="orderProducts">
                                        <script>
                                            inBasket(${orderProducts.product.id})
                                        </script>
                                    </c:forEach>


                                        <%--<form id="basket" action="/catalog/to_basket" method="post">

                                                &lt;%&ndash;                                    <button type="button" name="${product.id}" class="btn btn-success">В корзину</button>&ndash;%&gt;
                                            <input type="hidden" id="productId" name="id" value="${product.id}"/>
                                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                            <button class="btn btn-success active" id="btn" data-name="basket" type="button" onclick="inBasket(event)" value="В корзину"/>
                                        </form>--%>


                                        <%--<button type="button" class="btn btn-dark">Полная информация</button>
                                        <button type="button" class="btn btn-outline-secondary">Обсудить</button>--%>
                                </div>
                                <div class="col-md-5 order-md-1 my-products-image">
                                    <c:forEach items="${product.productImages}" var="image">
                                        <img src="<c:url value="${image.image}" />"
                                             class="card-img-top" alt="${product.name}">
                                    </c:forEach>
                                        <%--<img src="<c:url value="/static/img/products/mobile/apple/Iphone-11-black.jpg" />"
                                             class="card-img-top" alt="...">--%>
                                </div>
                            </div>

                            <hr class="featurette-divider">

                        </c:forEach>
                            <%--<c:if test="${products.totalPages>0}">
                            <nav aria-label="Page navigation example" >
                                <ul class="pagination" >
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            </c:if>--%>
                        <c:if test="${products.totalPages > 1 }">
                            <nav aria-label="Page navigation example">
                                Showing ${products.number+1} of ${products.totalElements}
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="/catalog/mobile/${0}/?${requestScope['javax.servlet.forward.query_string']}"
                                           aria-label="Previous">
                                            <span class="sr-only">Первая страница</span>
                                        </a>
                                    </li>
                                    <c:forEach begin="0" end="${products.totalPages-1}" var="page">
                                        <li class="page-item <c:if test="${page == products.number}"> active </c:if> ">
                                            <a href="/catalog/mobile/${page}/?${requestScope['javax.servlet.forward.query_string']}"
                                               class="page-link">${page+1}</a>
                                        </li>
                                    </c:forEach>
                                    <c:forEach begin="${products.totalPages-1}" end="${products.totalPages-1}" var="page">
                                    <li class="page-item">
                                        <a class="page-link" href="/catalog/mobile/${page}/?${requestScope['javax.servlet.forward.query_string']}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Следующая</span>
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
