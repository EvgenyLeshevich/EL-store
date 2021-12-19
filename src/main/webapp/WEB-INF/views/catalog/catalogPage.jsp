<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:wrapper title="Catalog">

    <section id="catalog" class="catalog">

        <div class="container px-4 py-5" id="custom-cards">
            <h2 class="pb-2 border-bottom"><spring:message code="app.catalog.text.smart"/></h2>


            <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
                <a href="/catalog/mobile/0" class="product-link">
                <div class="col">
                    <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg"
                         style="background-image: url('/static/img/catalog/smartphones1.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover;">
                        <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold"><spring:message code="app.catalog.text.smartphones"/></h2>
                        </div>
                    </div>
                </div>
                </a>

                <a href="/page-in-development" class="product-link">
                    <div class="col">
                        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg"
                             style="background-image: url(''); background-repeat: no-repeat; background-position: center; background-size: cover;">
                            <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                                <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold"><spring:message code="app.catalog.text.tablet"/></h2>
                            </div>
                        </div>
                    </div>
                </a>

                <a href="/page-in-development" class="product-link">
                    <div class="col">
                        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg"
                             style="background-image: url(''); background-repeat: no-repeat; background-position: center; background-size: cover;">
                            <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                                <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold"><spring:message code="app.catalog.text.watch"/></h2>
                            </div>
                        </div>
                    </div>
                </a>

            </div>
        </div>

        <div class="container px-4 py-5" id="custom-cards">
            <h2 class="pb-2 border-bottom"><spring:message code="app.catalog.text.lap"/></h2>


            <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
                <a href="/page-in-development" class="product-link">
                    <div class="col">
                        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg"
                             style="background-image: url(''); background-repeat: no-repeat; background-position: center; background-size: cover;">
                            <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                                <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold"><spring:message code="app.catalog.text.laptop"/></h2>
                            </div>
                        </div>
                    </div>
                </a>

                <a href="/page-in-development" class="product-link">
                    <div class="col">
                        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg"
                             style="background-image: url(''); background-repeat: no-repeat; background-position: center; background-size: cover;">
                            <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                                <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold"><spring:message code="app.catalog.text.computer"/></h2>
                            </div>
                        </div>
                    </div>
                </a>

                <a href="/page-in-development" class="product-link">
                    <div class="col">
                        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg"
                             style="background-image: url(''); background-repeat: no-repeat; background-position: center; background-size: cover;">
                            <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                                <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold"><spring:message code="app.catalog.text.monitor"/></h2>
                            </div>
                        </div>
                    </div>
                </a>

            </div>
        </div>

    </section>

</t:wrapper>
