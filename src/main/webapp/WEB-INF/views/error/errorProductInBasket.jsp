<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:wrapper title="Sign Up">

    <div class="container">
        <h1 class="error-h1">Что-то пошло не так</h1>
        <p class="zoom-area">${errorText} </p>
        <section class="error-container">
            <span>Oops</span>
        </section>
        <div class="link-container">
            <a href="/order" class="more-link">Назад</a>
        </div>
    </div>

</t:wrapper>
