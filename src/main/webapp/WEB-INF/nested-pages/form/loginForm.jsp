<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form class="p-4 p-md-5 border rounded-3 bg-light" action="/login" method="post">
    <div class="form-floating mb-3">
        <input type="text" name="username" class="form-control" id="floatingInput" placeholder="Username">
        <label for="floatingInput">Username</label>
    </div>
    <div class="form-floating mb-3">
        <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
        <label for="floatingPassword">Password</label>
    </div>
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> Remember me
        </label>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input class="w-100 btn btn-lg btn-primary" type="submit" value="Войти"/>
<%--    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>--%>
    <hr class="my-4">
    <small class="text-muted">Don't have an account yet? </small>
    <a class="navbar-brand" href="/signup">Sign Up</a>
</form>
