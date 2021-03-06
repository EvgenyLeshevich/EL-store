<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:wrapper title="Sign In">

    <section class="nav-account">
        <div class="col-md-10 mx-auto col-lg-8">
            <ul class="nav nav-tabs justify-content-center">
                <li class="nav-item">
                    <a class="nav-link" href="/profile"><spring:message code="app.text.profile"/></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/profile/security"><spring:message code="app.text.securityProfile"/></a>
                </li>
                <%--<li class="nav-item">
                    <a class="nav-link" href="#">Корзина</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Мои заказы</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Обсуждения</a>
                </li>--%>
            </ul>
        </div>
    </section>

    <section id="profileSecurity" class="profileSecurity">
        <div class="col-md-8 mx-auto col-lg-6" style="padding: 0 10px;">

            <c:choose>
                <c:when test="${updateSuccessful == false}">
                    <div class="alert alert-success" role="alert">
                            ${updateSuccessful}
                    </div>
                </c:when>
                <c:otherwise>
                </c:otherwise>
            </c:choose>

        <form method="post" action="/profile/security">
            <div class="row g-3 edit-info-profile">
                <p class="h3"><spring:message code="app.profileSec.text.changPass"/>:</p>

                <div class="col-sm-8">
                    <label for="passwordConfirmation" class="form-label"><spring:message code="app.profileSec.text.oldPass"/></label>
                    <input class="form-control in" type="password" name="oldPassword" id="passwordConfirmation"/>
                    <div class="validation">
                            ${errorPasswordMismatch}
                    </div>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" onclick="showPassword()" role="switch"
                               id="flexSwitchCheckDefault">
                        <label class="form-check-label" for="flexSwitchCheckDefault"><spring:message code="app.profileSec.text.showPass"/></label>
                    </div>
                </div>

                <div class="col-sm-8">
                    <label for="password" class="form-label"><spring:message code="app.profileSec.text.newPass"/></label>
                    <input class="form-control in" type="password" name="newPassword" id="password"/>
                    <div class="validation">
                            ${nullNewPassword}
                    </div>
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input class="w-100 btn btn-primary btn-lg" type="submit" value="<spring:message code="app.profileSec.text.changePass"/>"/>
            </div>
        </form>

        </div>
    </section>

</t:wrapper>
