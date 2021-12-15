<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:wrapper title="Sign In">

    <section id="update-successful" class="update-successful">
        Данные успешно обновлены! Перезайдите в аккаунт для применения данных!
        <form action="/logout" method="post">
            <input class="dropdown-item" type="submit" value="Sign Out"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </form>
    </section>

</t:wrapper>
