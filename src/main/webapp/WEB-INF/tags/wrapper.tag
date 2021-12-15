<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<%@attribute name="title" required="true" %>
<html>
<head>
    <title>${title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet">
    <script src="<c:url value="/static/js/bootstrap.bundle.min.js" />"></script>
    <script src="<c:url value="/static/js/main.js" />"></script>
    <link href="<c:url value="/static/css/main.css" />" rel="stylesheet">
    <link href="<c:url value="/static/css/error.css" />" rel="stylesheet"> <%--!!!!!!!!!!!!!--%>
    <link href="<c:url value="/static/css/404.css" />" rel="stylesheet">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
<header class="site-header sticky-top py-1">
    <jsp:include page="/WEB-INF/nested-pages/navbar.jsp"/>
</header>

<jsp:doBody/>

<footer class="container py-5">
    <jsp:include page="/WEB-INF/nested-pages/footer.jsp"/>
</footer>
</body>
</html>