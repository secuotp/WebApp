<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Secu OTP - Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled/signin.css" type="text/css" media="screen">
        <link rel="stylesheet" href="css/secuotp-page-login.css" type="text/css" media="screen">

        <script src="js/Chart.js"></script>
    </head>

    <body>
        <jsp:include page="header.jsp" flush="true" />
        <!-- main container -->
        <div class="content full-bg">
            <c:if test="${msg != null}">
                ${msg}
            </c:if>
            <div class="row-fluid login-wrapper">

                <div class="box">
                    <h2>Forgot Password</h2><br>
                    <div class="content-wrap">
                        
                        <form action="ForgotPasswordRequest" method="get">
                            <div class="field-box">
                                <label>Email:</label>
                                <input type="text" class="span8 inline-input" name="email" />
                            </div>
                            <button type="submit" class="btn-flat gray login">Send Email!</button>
                        </form>
                    </div>
                </div>
                <div class="no-account">
                    <p>Don't have an account?</p>
                    <a href="SignUp">Sign Up</a>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>