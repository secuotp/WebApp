<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Secu OTP - Reset Password</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled/signin.css" type="text/css" media="screen">
        <link rel="stylesheet" href="css/secuotp-page-login.css" type="text/css" media="screen">

        <script src="js/Chart.js"></script>
    </head>

    <body>
        <jsp:include page="/header.jsp" flush="true" />
        <!-- main container -->
        <div class="content full-bg">
            <c:if test="${msg != null}">
                ${msg}
            </c:if>
            <div class="row-fluid login-wrapper">

                <div class="box">
                    <div class="content-wrap">
                        <h6>Pasword Reset</h6>
                        <form action="ChangePassword" method="post">
                            <div class="field-box">
                                <label>Password:</label>
                                <input type="password" class="span8 inline-input" name="password" />
                            </div>
                            <div class="field-box">
                                <label>Repeat Password:</label>
                                <input type="password" class="span8 inline-input" name="password1" />
                            </div>
                            <input type="hidden" value="${requestScope.userId}" name="userId"/>
                            <button type="submit" class="btn-flat gray login">Change Password</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/footer.jsp" flush="true" />
    </body>

</html>