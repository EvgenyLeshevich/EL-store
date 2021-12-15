<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<t:wrapper title="Sign In">

    <section id="my-basket" class="my-basket">

        <div class="container">

            <div class="row g-5">
                <div class="col-md-5 col-lg-4 order-md-last">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-primary">Your cart</span>
                        <span class="badge bg-primary rounded-pill"></span>
                    </h4>
                    <form:form action="/order/product-save" method="post">
                    <ul class="list-group mb-3">
                        <c:forEach items="${products}" var="product">
                            <li class="list-group-item d-flex justify-content-between lh-sm">
                                <div>
                                    <h6 class="my-0">${product.product.name}</h6>
                                    <small class="text-muted">${product.product.description}</small>
                                    <div class="input-group my-count-product-in-basket">
                                        <input type="number" min="1" max="${product.product.count}"
                                               id="${product.product.name}" class="form-control" name="count"
                                               value="${product.count}"
                                               onclick="countProduct(max, document.getElementById('${product.product.name}').id, document.getElementById('${product.id}').id, document.getElementById('${product.id + 10000}').id)"
                                               onchange="countProduct(max ,document.getElementById('${product.product.name}').id, document.getElementById('${product.id}').id, document.getElementById('${product.id + 10000}').id)">

                                    </div>

                                    <a href="/order/${product.id}">Удалить</a>

                                </div>

                                <input type="hidden" name="productId" value="${product.id}">
                                <input type="hidden" name="productCount" value="${product.product.count}">

                                <input type="hidden" id="${product.id}" name="price" value="${product.product.price}">
                                <div>
                                    <span class="text-muted" id="${product.id + 10000}">${product.product.price}</span>
                                    $
                                </div>
                            </li>
                        </c:forEach>
                            <%--<li class="list-group-item d-flex justify-content-between bg-light">
                                <div class="text-success">
                                    <h6 class="my-0">Promo code</h6>
                                    <small>EXAMPLECODE</small>
                                </div>
                                <span class="text-success">−$5</span>
                            </li>--%>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Total</span>
                            <strong id="orderSum"></strong>
                        </li>
                    </ul>
                        <%--<form class="card p-2">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Promo code">
                                <button type="submit" class="btn btn-secondary">Redeem</button>
                            </div>
                        </form>--%>
                </div>

                <div class="col-md-7 col-lg-8">
                    <h4 class="mb-3">Billing address</h4>

                    <form:form action="/order/product-save" modelAttribute="user" method="post">
                    <div class="row g-3 edit-info-profile">

                        <div class="col-sm-6">
                            <form:label path="name" class="form-label">Имя </form:label>
                            <form:input type="text" path="name" id="name" class="form-control in"
                                        placeholder="${user.name}"/>
                            <form:errors path="name" cssClass="validation"/>
                        </div>

                        <div class="col-sm-6">
                            <form:label path="surname" class="form-label">Фамилия </form:label>
                            <form:input type="text" path="surname" id="surname" class="form-control in"
                                        placeholder="${user.surname}"/>
                            <form:errors path="surname" cssClass="validation"/>
                        </div>

                        <div class="col-12">
                            <form:label path="phoneNumber" class="form-label">Номер телефона </form:label>
                            <form:input type="tel" path="phoneNumber" id="phoneNumber" class="form-control in"
                                        placeholder="${user.phoneNumber}"/>
                            <form:errors path="phoneNumber" cssClass="validation"/>
                        </div>

                        <div class="col-12">
                            <form:label path="email" class="form-label">Электронная почта </form:label>
                            <form:input type="text" path="email" id="email" class="form-control in"
                                        placeholder="${user.email}"/>
                            <form:errors path="email" cssClass="validation"/>
                        </div>

                        <div class="col-md-5">
                            <form:label path="countryName" class="form-label">Страна </form:label>
                            <form:select path="countryName" class="form-select"
                                         onchange="showCitiesByCountry(this.value)">
                                <option selected disabled value="">Choose...</option>
                                <form:options items="${countries}" itemValue="countryName" itemLabel="countryName"/>
                            </form:select>
                            <form:errors path="countryName" cssClass="validation"/>
                        </div>

                        <style id="style">
                            #cities :not([disabled]) {
                                display: none;
                            }
                        </style>

                        <div class="col-md-4">
                            <form:label path="cityName" class="form-label">Город </form:label>
                            <form:select id="cities" path="cityName" class="form-select">
                                <option selected disabled value="dis">Choose...</option>
                                <c:forEach items="${countries}" var="country">
                                    <form:options cssClass="${country.countryName}" items="${country.cities}"
                                                  itemValue="cityName" itemLabel="cityName"/>
                                </c:forEach>
                            </form:select>
                            <form:errors path="cityName" cssClass="validation"/>
                        </div>

                        <div class="col-md-3">
                            <form:label path="postcode" class="form-label">Почтовый индекс </form:label>
                            <form:input type="text" path="postcode" id="postcode" class="form-control in"
                                        placeholder="${user.postcode}"/>
                            <form:errors path="postcode" cssClass="validation"/>
                        </div>

                        <div class="col-12">
                            <form:label path="apartmentAddress" class="form-label">Адрес </form:label>
                            <form:input type="text" path="apartmentAddress" id="apartmentAddress"
                                        class="form-control in"
                                        placeholder="${user.apartmentAddress}"/>
                            <form:errors path="apartmentAddress" cssClass="validation"/>
                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                        </div>

                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input class="w-100 btn btn-primary btn-lg" type="submit" value="Заказать"/>

                        </form:form>
                        </form:form>

                    </div>
                </div>
            </div>
        </div>
    </section>

</t:wrapper>