<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="col-md-8 mx-auto col-lg-6" style="padding: 0 10px;">
    <h2 class="mb-3">Sign Up</h2>
    <c:choose>
        <c:when test="${message == false}">
            <div class="alert alert-danger" role="alert">
                    ${message}
            </div>
        </c:when>
        <c:when test="${checkEmail == false}">
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading">${checkEmail}</h4>
                <p>Подтвердите регистрацию по ссылке на почте, спасибо что выбрали нас)</p>
            </div>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>

    <form:form action="/signup" modelAttribute="user" method="post">
        <div class="row g-3 sign-up">

        <div class="col-sm-6">
            <form:label path="name" class="form-label">Имя </form:label>
            <form:input type="text" path="name" id="name" class="form-control in" placeholder="Евгений"/>
            <form:errors path="name" cssClass="validation"/>
        </div>

        <div class="col-sm-6">
            <form:label path="surname" class="form-label">Фамилия <span
                    class="text-muted">(Необязательное)</span></form:label>
            <form:input type="text" path="surname" id="surname" class="form-control in" placeholder="Смит"/>
            <form:errors path="surname" cssClass="validation"/>
        </div>

        <div class="col-12">
            <form:label path="phoneNumber" class="form-label">Номер телефона </form:label>
            <form:input type="tel" path="phoneNumber" id="phoneNumber" class="form-control in"/>
            <form:errors path="phoneNumber" cssClass="validation"/>
        </div>

        <div class="col-12">
            <form:label path="email" class="form-label">Электронная почта </form:label>
            <form:input type="text" path="email" id="email" class="form-control in" placeholder="you@example.com"/>
            <form:errors path="email" cssClass="validation"/>
        </div>

        <div class="col-12">
            <form:label path="username" class="form-label">Логин </form:label>
            <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <form:input type="text" path="username" id="username" class="form-control in"
                            placeholder="логин"/>
            </div>
            <form:errors path="username" cssClass="validation"/>
        </div>

        <div class="col-sm-6">
            <form:label path="password" class="form-label">Пароль </form:label>
            <form:input type="password" path="password" id="password" class="form-control in"/>
            <form:errors path="password" cssClass="validation"/>
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" onclick="showPassword()" role="switch" id="flexSwitchCheckDefault">
                <label class="form-check-label" for="flexSwitchCheckDefault">Показать пароли</label>
            </div>
        </div>

        <div class="col-sm-6">
            <form:label path="passwordConfirmation" class="form-label">Подтвердите пароль </form:label>
            <form:input type="password" path="passwordConfirmation" id="passwordConfirmation"
                        class="form-control in"/>
            <form:errors path="passwordConfirmation" cssClass="validation"/>
            <div class="validation">
                    ${passwordTwoError}
            </div>
        </div>

        <form:form action="/signup" modelAttribute="country" method="post">
            <div class="col-md-5">
                <form:label path="countryName" class="form-label">Страна </form:label>
                <form:select path="countryName" class="form-select" onchange="showCitiesByCountry(this.value)">
                    <option selected disabled value="">Choose...</option>
                    <form:options items="${countries}" itemValue="countryName" itemLabel="countryName"/>
                </form:select>
                <form:errors path="countryName" cssClass="validation"/>
            </div>

            <form:form action="/signup" modelAttribute="city" method="post">

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

       <%--             <div class="col-md-5">
                        <label class="form-label">Country</label>
                        <select class="form-select" id="country" value="${country.countryName}" name="countryName" onchange="showCitiesByCountry(this.value)">
                            <option selected disabled value="">Choose...</option>
                            <c:forEach items="${countries}" var="country">
                                <option value="${country.countryName}">${country.countryName}</option>
                            </c:forEach>
                        </select>
                        <p class="validation">${countryCodeError}</p>
                    </div>

                    <style id="style">
                        #cities :not([disabled]) {
                            display: none;
                        }
                    </style>

                    <div class="col-md-4">
                        <label class="form-label">City</label>
                        <select id="cities" class="form-select" value="${city.cityName}" name="cityName">
                            <option selected disabled value="dis">Choose...</option>
                            <c:forEach items="${countries}" var="country">
                                <c:forEach items="${country.cities}" var="city">
                                    <option class="${country.countryName}">${city.cityName}</option>
                                </c:forEach>
                            </c:forEach>
                        </select>
                        <p class="validation">${cityCodeError}</p>
                    </div>--%>

                <form:form action="/signup" modelAttribute="address" method="post">
                    <div class="col-md-3">
                        <form:label path="postcode" class="form-label">Почтовый индекс </form:label>
                        <form:input type="text" path="postcode" id="postcode" class="form-control in"/>
                        <form:errors path="postcode" cssClass="validation"/>
                    </div>
                    <div class="col-12">
                        <form:label path="apartmentAddress" class="form-label">Адрес </form:label>
                        <form:input type="text" path="apartmentAddress" id="apartmentAddress" class="form-control in"/>
                        <form:errors path="apartmentAddress" cssClass="validation"/>
                    </div>

                    <div>
                        <div class="g-recaptcha" data-sitekey="6LfgCCIdAAAAANcFcRe8ONSBwwdlyzPRat8i78ko"></div>
                        <div class="validation">
                                ${captchaError}
                        </div>
                    </div>
                    </div>

                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input class="w-100 btn btn-primary btn-lg" type="submit" value="Зарегистрироваться"/>

                </form:form>
            </form:form>
        </form:form>
    </form:form>

</div>