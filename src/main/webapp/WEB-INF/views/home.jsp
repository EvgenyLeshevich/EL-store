<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:wrapper title="EL-store">

    <section id="welcome" class="welcome">
        <jsp:include page="/WEB-INF/nested-pages/home/welcome.jsp"/>
    </section>

    <sec:authorize access="!isAuthenticated()">
        <section id="sign-in" class="sign-in">
            <jsp:include page="/WEB-INF/nested-pages/home/signIn.jsp"/>
        </section>
    </sec:authorize>

    <section id="popular-product" class="popular-product">
            <jsp:include page="/WEB-INF/nested-pages/home/popularProduct.jsp"/>
    </section>

    <section id="subsections" class="subsections">
        <jsp:include page="/WEB-INF/nested-pages/home/subsections.jsp"/>
    </section>

</t:wrapper>
