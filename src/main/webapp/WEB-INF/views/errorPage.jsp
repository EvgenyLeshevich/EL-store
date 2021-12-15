<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:wrapper title="EL-store">

    <section class="error-page">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-6 offset-lg-3 col-sm-6 offset-sm-3 col-12 p-3 error-main">
                    <div class="row">
                        <div class="col-lg-8 col-12 col-sm-10 offset-lg-2 offset-sm-1">
                            <h1 class="m-0">404</h1>
                            <h6>Page not found</h6>
                            <p>${error}</p>
                            <a href="#" OnClick="history.back();">Назад</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</t:wrapper>
