<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<c:if test="${!message}">--%>
<%--    <div class="alert alert-${messageType}" role="alert">--%>
<%--            ${message}--%>
<%--    </div>--%>
<%--</c:if>--%>

<%--<form:form action="/login" method="post">--%>
<%--    <c:if test="${param.error != null}">--%>
<%--        <div class="form-group">--%>
<%--            <div class="alert alert-danger col-md-10 col-md-offset-1">--%>
<%--                <strong>Error!</strong> Invalid username or password..--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </c:if>--%>
<%--    <div><label> User Name : <input type="text" name="username"/> </label></div>--%>
<%--    <div><label> Password: <input type="password" name="password"/> </label></div>--%>
<%--    <input type="hidden" name="_csrf" value="${_csrf.token}" />--%>
<%--    <div><input type="submit" value="Sign In"/></div>--%>
<%--</form:form>--%>

<%--<a href="/registration">Add new user</a>--%>

<div class="col-md-10 mx-auto col-lg-5">
    <h1>Sign in</h1>
    <div class="alert alert-danger" role="alert">
        A simple danger alert—check it out!
    </div>
    <form class="p-4 p-md-5 border rounded-3 bg-light">
        <div class="form-floating mb-3">
            <input type="username" class="form-control" id="floatingInput" placeholder="Username">
            <label for="floatingInput">Username</label>
        </div>
        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">Password</label>
        </div>
        <div class="checkbox mb-3">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
        <hr class="my-4">
        <small class="text-muted">Don't have an account yet? </small>
        <a class="navbar-brand" href="#">Sign Up</a>
    </form>
</div>