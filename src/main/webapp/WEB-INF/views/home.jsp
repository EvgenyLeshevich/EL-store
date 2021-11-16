<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:wrapper title="EL-store">

    <section id="welcome" class="welcome">
        <jsp:include page="/WEB-INF/nested-pages/home/welcome.jsp"/>
    </section>

    <section id="sign-in" class="sign-in">
        <jsp:include page="/WEB-INF/nested-pages/home/signIn.jsp"/>
    </section>

    <section id="subsections" class="subsections">
        <jsp:include page="/WEB-INF/nested-pages/home/subsections.jsp"/>
    </section>

</t:wrapper>
