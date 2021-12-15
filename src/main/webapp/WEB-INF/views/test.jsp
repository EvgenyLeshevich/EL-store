<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="<c:url value="/static/js/main.js" />"></script>
</head>
<body>

<select id="country" onchange="showCitiesByCountry(this.value)">
    <option selected disabled>--</option>
    <option value="fr">France</option>
    <option value="in">India</option>
    <option value="ru">Russia</option>
</select>

<style id="style">
    #cities :not([disabled]) {
        display: none;
    }
</style>



<select id="cities">
    <option value="dis" selected disabled>--</option>
    <option class="ru">Moscow</option>
    <option class="fr">Paris</option>
    <option class="ru">Sebastopol</option>
    <option class="ru">Kursk</option>
    <option class="in">Delhi</option>
    <option class="fr">Marseille</option>
    <option class="in">Mumbai</option>
</select>


<%--<script>function showCitiesByCountry(country) {--%>
<%--    document.getElementById("cities").value="dis";--%>
<%--    document.getElementById("style").innerHTML = '#cities :not(.' + country + ') {display:none;}';--%>
<%--}--%>
<%--</script>--%>

</body>
</html>
