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
                    <h2>Login</h2><br>
                    <div class="content-wrap">
                        
                        <form action="UserLogin" method="post">
                            <div class="field-box">
                                <label>Username:</label>
                                <input type="text" class="span8 inline-input" name="username" />
                            </div>
                            <div class="field-box">
                                <label>Password:</label>
                                <input type="password" class="span8 inline-input" name="password" />
                            </div>
                            <a href="ForgotPassword" class="forgot">Forgot password?</a>
                            <div class="remember">
                                <input id="remember-chkbox" type="checkbox" name="remember" value="1" />
                                <label for="remember-chkbox" style="cursor: pointer">Remember me</label>
                            </div>
                            <button type="submit" class="btn-flat gray login">Login</button>
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