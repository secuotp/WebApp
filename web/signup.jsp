<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Secu OTP - Sign Up</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- this page specific styles -->
        <link rel="stylesheet" href="css/compiled//form-wizard.css" type="text/css" media="screen">
        <link rel="stylesheet" href="css/compiled/signin.css" type="text/css" media="screen">
        <link rel="stylesheet" href="css/secuotp-page-signup.css" type="text/css" media="screen">

        <script src="js/Chart.js"></script>
    </head>

    <body>
        <jsp:include page="header.jsp" flush="true" />
        <!-- main container -->
        <div class="content full-bg">

            <c:if test="${msg != null}">
                <div style="margin: 10px" class="alert alert-error">
                    <i class="icon-remove-sign"></i>
                    ${msg}
                </div>
            </c:if>

            <div class="row-fluid login-wrapper">
                <div class="box">
                    <div class="content-wrap">
                        <div class="row-fluid">
                            <div class="span6 form-step">A</div>
                            <div class="span6 form-step">B</div>
                        </div>
                        <form action="UserLogin" method="post">
                            <div id="step1">
                                <div class="field-box">
                                    <label>Uesrname:</label>
                                    <input type="text" class="span8 inline-input" name="username" />
                                </div>
                                <div class="field-box">
                                    <label>Password:</label>
                                    <input type="password" class="span8 inline-input" name="password" />
                                </div>
                                <a href="#" class="forgot">Forgot password?</a>
                                <div class="remember">
                                    <input id="remember-chkbox" type="checkbox" name="remember" value="1" />
                                    <label for="remember-chkbox" style="cursor: pointer">Remember me</label>
                                </div>
                                <div style="height: 33px">
                                    <button type="button" class="btn-flat primary login" style="float: right">
                                        Login&nbsp;
                                        <i class="icon-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                            <div id="step2">

                            </div>
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