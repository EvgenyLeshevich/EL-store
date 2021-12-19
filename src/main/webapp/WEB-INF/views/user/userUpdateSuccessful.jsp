<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:wrapper title="Sign In">

    <section id="update-successful" class="update-successful">
        <spring:message code="app.userUpdateSuc.text.success"/>
        <form action="/logout" method="post">
            <input class="dropdown-item" type="submit" value="<spring:message code="app.text.signOut"/>"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </form>
    </section>

</t:wrapper>
