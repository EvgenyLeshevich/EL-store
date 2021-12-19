<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-12 col-md">
        <small class="d-block mb-3 text-muted">© 2021–2021</small>
    </div>
    <div class="col-6 col-md">
        <h5><spring:message code="app.text.section"/>:</h5>
        <ul class="list-unstyled text-small">
            <li><a class="link-secondary" href="/catalog"><spring:message code="app.text.catalog"/></a></li>
            <li><a class="link-secondary" href="/page-in-development"><spring:message code="app.text.discussions"/></a></li>
        </ul>
    </div>
    <div class="col-6 col-md">
        <h5><spring:message code="app.text.aboutUs"/>:</h5>
        <ul class="list-unstyled text-small">
            <li><a class="link-secondary" href="https://github.com/EvgenyLeshevich?tab=repositories" target="_blank">GitHub</a><img
                    class="logo" src="<c:url value="/static/img/logo/github.png" />" alt="GitHub" width="15"
                    height="15"></li>
            <li><a class="link-secondary" href="#" target="_blank">LinkedIn</a><img class="logo"
                                                                    src="<c:url value="/static/img/logo/linkedin.png" />"
                                                                    alt="GitHub" width="15" height="15"></li>
            <li><a class="link-secondary" href="mailto:jeniya.leshevich@yandex.by" target="_blank">Email</a><img class="logo"
                                                                 src="<c:url value="/static/img/logo/email.png" />"
                                                                 alt="GitHub" width="15" height="15"></li>
            <li><a class="link-secondary" href="https://www.instagram.com/ah4udo/" target="_blank">Instagram</a><img class="logo"
                                                                     src="<c:url value="/static/img/logo/instagram.png" />"
                                                                     alt="GitHub" width="15" height="15"></li>
        </ul>
    </div>
    <div class="col-6 col-md">
        <h5><spring:message code="app.text.help"/>:</h5>
        <ul class="list-unstyled text-small">
            <li><a class="link-secondary" href="tel:+375292053578">+375292053578</a></li>
            <li><a class="link-secondary" href="https://telegram.me/ah4udo" target="_blank">Telegram </a></li>
            <li><a class="link-secondary" href="https://viber.click/375292053578" target="_blank">Viber</a></li>
        </ul>
    </div>
    <div class="col-6 col-md">
        <h5><spring:message code="app.text.orders"/>:</h5>
        <ul class="list-unstyled text-small">
            <li><a class="link-secondary"><spring:message code="app.text.bank"/></a></li>
        </ul>
    </div>
</div>