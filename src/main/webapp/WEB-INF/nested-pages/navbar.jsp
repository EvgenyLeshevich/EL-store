<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Eighth navbar example">
    <div class="container">
        <a class="navbar-brand" href="/">EL-store</a>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse collapse" id="navbarsExample07" style="">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="/catalog/mobile/0"><spring:message code="app.text.catalog"/></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/page-in-development"><spring:message code="app.text.discussions"/></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="dropdown07" data-bs-toggle="dropdown"
                       aria-expanded="false"><spring:message code="app.lang.title"/></a>
                    <ul class="dropdown-menu" aria-labelledby="dropdown07">
                        <li><a class="dropdown-item" href="?lang=ru"><spring:message code="app.lang.russian"/></a></li>
                        <li><a class="dropdown-item" href="?lang=en"><spring:message code="app.lang.english"/></a></li>
                    </ul>
                </li>
            </ul>
            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" method="get" action="/catalog/mobile/0">
                <input type="search" class="form-control form-control-dark" placeholder="<spring:message code="app.text.search"/>..." name="name" aria-label="Search">
            </form>
            <a href="/order" class="product-link">
            <div class="btn position-relative basket">
                <img src="<c:url value="/static/img/logo/basket.png" />" alt="mdo" width="32" height="32"
                     class="rounded-circle">
                <span class="position-absolute top-50 start-100 translate-middle badge rounded-pill bg-gradient">

                    </span>
            </div>
            </a>
            <div class="text-end">
                <%--<button type="button" class="btn btn-primary position-relative">
                    Inbox
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                        99+
                        <span class="visually-hidden">unread messages</span>
                    </span>
                </button>--%>
                <sec:authorize access="!isAuthenticated()">
                    <a href="/login" class="btn btn-outline-light me-2"><spring:message code="app.text.signIn"/></a>
                    <a href="/signup" class="btn btn-warning"><spring:message code="app.text.signUp"/></a>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <div class="dropdown text-end">
                        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="<c:url value="/static/img/logo/user.png" />" alt="mdo" width="32" height="32"
                                 class="rounded-circle">
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-macos mx-0 border-0 shadow"
                            aria-labelledby="dropdownUser1"
                            style="position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate3d(0px, 34px, 0px);"
                            data-popper-placement="bottom-end">
                            <li><a class="dropdown-item" href="/profile"><spring:message code="app.text.profile"/></a></li>
                            <li><a class="dropdown-item" href="/profile/security"><spring:message code="app.text.securityProfile"/></a></li>
                            <sec:authorize access="hasAuthority('ADMIN')">
                            <li><a class="dropdown-item" href="/admin/products"><spring:message code="app.text.profile.admin.products"/></a></li>
                            </sec:authorize>
                            <%--<li><a class="dropdown-item" href="/page-in-development">Мои заказы</a></li>
                            <li><a class="dropdown-item" href="/page-in-development">Обсуждения</a></li>--%>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <form action="/logout" method="post">
                                    <input class="dropdown-item" type="submit" value="<spring:message code="app.text.signOut"/>"/>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                </form>
                            </li>
                        </ul>
                    </div>
                </sec:authorize>
            </div>
        </div>
    </div>
</nav>