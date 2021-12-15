<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:wrapper title="Sign Up">

    <section id="registration" class="registration">
        <jsp:include page="/WEB-INF/nested-pages/signUp/signUp.jsp"/>
    </section>

</t:wrapper>