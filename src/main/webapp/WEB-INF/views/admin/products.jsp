<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:wrapper title="EL-store">

    <section>
        <div class="container">
            <div class="row">
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

                    <c:forEach items="${products}" var="product">
                        <form method="post" action="/admin/products/${product.id}">
                            <div class="row featurette">
                                <div class="col-md-7 order-md-2">
                                    <h2 class="featurette-heading"><spring:message
                                            code="app.products.text.smart"/> ${product.brand.name} ${product.name} <span
                                            class="text-muted">${product.description}</span>
                                    </h2>
                                    <h1>Цена:</h1>
                                    <input class="form-control in" type="text" name="price"
                                           value="${product.price}$">
                                    <h1>Остаток на складе:</h1>
                                    <input class="form-control in" type="text" name="count"
                                           value="${product.count}">
                                    <br>
                                    <input class="w-100 btn btn-primary btn-lg" type="submit" value="Обновить"/>
                                </div>
                                <hr class="featurette-divider">
                            </div>
                        </form>
                    </c:forEach>

                </main>
            </div>
        </div>
    </section>

</t:wrapper>
