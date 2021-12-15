<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:wrapper title="Sign Up">

    <section id="order-successful" class="order-successful">
        <div class="container">
            <h1 class="error-h1">Оформление завершено успешно</h1>
            <p class="zoom-area">Данные вашего заказа вы можете посмотреть у себя на почте</p>
            <section class="error-container">
                <span class="main-message">Good</span>
            </section>
            <div class="link-container">
                <a href="/catalog" class="more-link">Перейти в каталог</a>
            </div>
        </div>
    </section>

</t:wrapper>
