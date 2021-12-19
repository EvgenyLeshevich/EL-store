<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form class="p-4 p-md-5 border rounded-3 bg-light" action="/login" method="post">
    <div class="form-floating mb-3">
        <input type="text" name="username" class="form-control" id="floatingInput" placeholder="<spring:message code="app.text.username"/>">
        <label for="floatingInput"><spring:message code="app.text.username"/></label>
    </div>
    <div class="form-floating mb-3">
        <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="<spring:message code="app.text.pass"/>">
        <label for="floatingPassword"><spring:message code="app.text.pass"/></label>
    </div>
    <%--<div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> Remember me
        </label>
    </div>--%>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input class="w-100 btn btn-lg btn-primary" type="submit" value="<spring:message code="app.text.signIn"/>"/>
<%--    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>--%>
    <hr class="my-4">
    <small class="text-muted"><spring:message code="app.home.text.dntHaveAcc"/> </small>
    <a class="navbar-brand" href="/signup"><spring:message code="app.text.signUp"/></a>
</form>
