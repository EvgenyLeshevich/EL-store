<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<t:wrapper title="EL-store">

    <section class="nav-account">
        <div class="col-md-10 mx-auto col-lg-8">
            <ul class="nav nav-tabs justify-content-center">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/profile">Профиль</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/profile/security">Безопасность аккаунта</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Корзина</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Мои заказы</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Обсуждения</a>
                </li>
            </ul>
        </div>
    </section>

    <section class="profile">
        <div class="col-md-8 mx-auto col-lg-6" style="padding: 0 10px;">

            <figure>
                <blockquote class="blockquote">
                    <p>Посмотреть и отредактировать информацию своего профиля вы можете здесь</p>
                </blockquote>
                <figcaption class="blockquote-footer">
                    Будьте внимательны при изменении данных!
                </figcaption>
            </figure>

                <%--<form:form action="/profile" modelAttribute="user" method="post">
                <div class="row g-3 edit-info-profile">

                    <p class="h3">Общая информация:</p>

                    <div class="col-sm-6">
                        <form:label path="name" class="form-label">Имя </form:label>
                        <form:input type="text" path="name" id="name" class="form-control in" placeholder="${user.name}"/>
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
                        <form:input type="tel" path="phoneNumber" id="phoneNumber" class="form-control in" placeholder="${user.phoneNumber}"/>
                        <form:errors path="phoneNumber" cssClass="validation"/>
                    </div>

                    <div class="col-12">
                        <form:label path="email" class="form-label">Электронная почта </form:label>
                        <form:input type="text" path="email" id="email" class="form-control in"
                                    placeholder="${user.email}"/>
                        <form:errors path="email" cssClass="validation"/>
                    </div>

                    <div class="col-12">
                        <form:label path="username" class="form-label">Логин </form:label>
                        <div class="input-group has-validation">
                            <span class="input-group-text">@</span>
                            <form:input type="text" path="username" id="username" class="form-control in"
                                        placeholder="${user.username}"/>
                        </div>
                        <form:errors path="username" cssClass="validation"/>
                    </div>


                    <form:input type="hidden" path="password" id="password" class="form-control in" value="123"/>

                    <p class="h3">Ваш адрес:</p>

                    <form:form action="/profile" modelAttribute="country" method="post">
                        <div class="col-md-5">
                            <form:label path="countryName" class="form-label">Страна </form:label>
                            <form:select path="countryName" class="form-select" onchange="showCitiesByCountry(this.value)">
                                <option selected disabled value="">Choose...</option>
                                <form:options items="${countries}" itemValue="countryName" itemLabel="countryName"/>
                            </form:select>
                            <form:errors path="countryName" cssClass="validation"/>
                        </div>

                        <form:form action="/profile" modelAttribute="city" method="post">

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

                            <form:form action="/profile" modelAttribute="address" method="post">
                                <div class="col-md-3">
                                    <form:label path="postcode" class="form-label">Почтовый индекс </form:label>
                                    <form:input type="text" path="postcode" id="postcode" class="form-control in" placeholder="${user.address.postcode}"/>
                                    <form:errors path="postcode" cssClass="validation"/>
                                </div>
                                <div class="col-12">
                                    <form:label path="apartmentAddress" class="form-label">Адрес </form:label>
                                    <form:input type="text" path="apartmentAddress" id="apartmentAddress"
                                                class="form-control in" placeholder="${user.address.apartmentAddress}"/>
                                    <form:errors path="apartmentAddress" cssClass="validation"/>
                                </div>


                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <input class="w-100 btn btn-primary btn-lg" type="submit" value="Обновить"/>

                            </form:form>
                        </form:form>
                    </form:form>
                    </form:form>--%>


            <form:form action="/profile" modelAttribute="user" method="post">
            <div class="row g-3 edit-info-profile">

                <p class="h3">Общая информация:</p>

                <div class="col-sm-6">
                    <form:label path="name" class="form-label">Имя </form:label>
                    <form:input type="text" path="name" id="name" class="form-control in" placeholder="${user.name}"/>
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

                <p class="h3">Ваш адрес:</p>

                <div class="col-md-5">
                    <form:label path="countryName" class="form-label">Страна </form:label>
                    <form:select path="countryName" class="form-select" onchange="showCitiesByCountry(this.value)">
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
                    <form:input type="text" path="apartmentAddress" id="apartmentAddress" class="form-control in"
                                placeholder="${user.apartmentAddress}"/>
                    <form:errors path="apartmentAddress" cssClass="validation"/>
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input class="w-100 btn btn-primary btn-lg" type="submit" value="Обновить"/>

                </form:form>

            </div>
    </section>

</t:wrapper>